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

    // 2. SÓ EXECUTA SE O JOGADOR TIVER DINHEIRO E O SLOT NÃO ESTIVER OCUPADO
    // Adicionei is_occupied aqui por segurança, embora o sistema já esconda o slot
    if (global.cash_amount >= _cost && !is_occupied) {
        
        global.cash_amount -= _cost;

        // 3. CALCULAR O CENTRO
        var _offset = 32; 

        // 4. CRIAR A TORRE NO CENTRO
        instance_create_depth(
            x + _offset, 
            y + _offset, 
            get_layer_depth(LAYER.towers),
            global.instance_tower_to_build
        );

        // 5. TRATAMENTO ESPECIAL PARA A BOMBA EXPONENCIAL
        if (global.instance_tower_to_build == obj_Tower_Exp) {
            // Se for a bomba, resetamos o slot para que ele possa ser usado de novo
            is_occupied = false;
            can_be_seen = false;
            image_index = 0;
        } else {
            // Se for uma torre fixa, o slot é destruído para sempre
            instance_destroy();
        }

        // 6. LIMPAR ESTADOS GLOBAIS
        global.instance_tower_to_build = noone;
        obj_Mouse.selected_sprite = noone;

        with(obj_Placeable){
            can_be_seen = false;
        }
        
        show_debug_message("Torre construída! Custo: " + string(_cost));
        
    } else {
        show_debug_message("Falha na construção: Saldo insuficiente ou slot ocupado!");
    }
}