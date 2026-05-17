// 1. SEGURANÇA: Só executa se o painel estiver visível e o pai existir
if (!visible || !instance_exists(parent)) exit;

// 2. DETECÇÃO DE ÁREA: Checa se o mouse soltou em cima do retângulo (140x50)
if (mouse_x > x - 70 && mouse_x < x + 70 && mouse_y > y - 25 && mouse_y < y + 25) {
    
    // Pegamos a referência da torre que o painel está mostrando
    var _tower = parent.selected_tower;

    if (instance_exists(_tower)) {
        
        // --- LÓGICA FINANCEIRA ---
        // Recupera 60% do valor total investido (Compra + Upgrades)
        var _refund = floor(_tower.total_invested * 0.6);
        global.cash_amount += _refund;
        
        // --- FEEDBACK VISUAL ---
        var _pop = instance_create_depth(_tower.x, _tower.y, _tower.depth - 100, obj_FloatText);
        if (instance_exists(_pop)) {
            _pop.text = "+$" + string(_refund);
        }

        // --- RESTAURAÇÃO DO MAPA (SOLUÇÃO PARA ESCALA 2x2) ---
        // Criamos o slot exatamente onde a torre nasceu.
        // Depth 100 joga ele para trás das torres.
        var _slot = instance_create_depth(_tower.my_slot_x, _tower.my_slot_y, 100, obj_Placeable);
        
        if (instance_exists(_slot)) {
            // AJUSTE DE ESCALA: Como seu cenário usa 2x2, forçamos aqui:
            _slot.image_xscale = 2.0; 
            _slot.image_yscale = 2.0;
            
            // RESET DE ESTADO: Garante que ele se comporte como um slot novo
            _slot.is_occupied = false;
            _slot.can_be_seen = false;   
            _slot.is_being_hover = false;
            _slot.image_index = 0;
            
            // Deixamos o objeto ativo para que seu sistema de construção o detecte
            show_debug_message("Slot restaurado com escala 2.0 em: " + string(_tower.my_slot_x));
        }
        
        // --- FINALIZAÇÃO ---
        // Destrói a torre física
        instance_destroy(_tower);
        
        // Esconde o painel de upgrade
        parent.hide();
        
        show_debug_message("Venda concluída com sucesso.");
    }
}