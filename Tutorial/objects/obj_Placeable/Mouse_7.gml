if (global.instance_tower_to_build != noone) {
    
    // 1. DEFINIR O PREÇO BASEADO NA TORRE QUE ESTÁ NA MÃO
    var _cost = 0;
    
    switch(global.instance_tower_to_build) {
        case obj_Tower_Sum:  _cost = 100; break;
        case obj_Tower_Sub:  _cost = 80; break;
        case obj_Tower_Exp:  _cost = 50; break;
        case obj_Tower_Div:  _cost = 120; break;
        case obj_Tower_Mult: _cost = 150; break;
        default:             _cost = 0;   break;
    }

    // 2. SÓ EXECUTA SE O JOGADOR TIVER DINHEIRO
    if (global.cash_amount >= _cost) {
        
        // DEBITA O DINHEIRO AQUI (Pagamento na entrega!)
        global.cash_amount -= _cost;

        // 3. CALCULAR O CENTRO (Seu código de offset)
        var _offset = 32; 

        // 4. CRIAR A TORRE NO CENTRO
        instance_create_depth(
            x + _offset, 
            y + _offset, 
            get_layer_depth(LAYER.towers),
            global.instance_tower_to_build
        );

        // 5. LIMPAR ESTADOS E DESTRUIR SLOT
        global.instance_tower_to_build = noone;
        obj_Mouse.selected_sprite = noone;
        instance_destroy();

        with(obj_Placeable){
            can_be_seen = false;
        }
        
        show_debug_message("Torre construída! Custo: " + string(_cost));
        
    } else {
        // Feedback opcional se o saldo for insuficiente
        show_debug_message("Saldo insuficiente para construir esta torre!");
    }
}