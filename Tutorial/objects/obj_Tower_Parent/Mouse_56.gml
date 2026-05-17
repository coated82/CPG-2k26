// 1. SEGURANÇA: Só executa se o painel estiver visível e o pai existir
if (!visible || !instance_exists(parent)) exit;

// 2. DETECÇÃO DE ÁREA: Checa se o mouse soltou em cima do retângulo (140x50)
// Como o Origin da sua sprite spr_Menu é Middle Center, usamos x +/- metade da largura
if (mouse_x > x - 70 && mouse_x < x + 70 && mouse_y > y - 25 && mouse_y < y + 25) {
    
    // Pegamos a referência da torre que o painel está mostrando
    var _tower = parent.selected_tower;

    if (instance_exists(_tower)) {
        
        // --- LÓGICA FINANCEIRA ---
        // Recupera 60% do valor total investido (Compra + Upgrades)
        var _refund = floor(_tower.total_invested * 0.6);
        global.cash_amount += _refund;
        
        // --- FEEDBACK VISUAL ---
        // Cria o texto flutuante no local da torre
        var _pop = instance_create_depth(_tower.x, _tower.y, _tower.depth - 100, obj_FloatText);
        if (instance_exists(_pop)) {
            _pop.text = "+$" + string(_refund);
        }

        // --- RESTAURAÇÃO DO MAPA ---
        // Recria o slot vazio exatamente onde a torre estava
        // IMPORTANTE: my_slot_x/y devem ter sido passados no momento da compra
        instance_create_depth(_tower.my_slot_x, _tower.my_slot_y, _tower.depth + 1, obj_Placeable);
        
        // --- FINALIZAÇÃO ---
        show_debug_message("Torre vendida: " + _tower.name + " | Reembolso: $" + string(_refund));
        
        // Destrói a torre física
        instance_destroy(_tower);
        
        // Avisa o painel para se esconder (já que a torre sumiu)
        parent.hide();
    }
}