function tower_select(_tower) {
    tower_deselect();
    global.selected_tower = _tower;
    
    if (instance_exists(global.selected_tower)) {
        global.selected_tower.is_selected = true;
        if (instance_exists(obj_UI_Panel_Upgrade)) {
            obj_UI_Panel_Upgrade.show(global.selected_tower);
        }
    }
}

function tower_deselect() {
    if (global.selected_tower != noone) {
        if (instance_exists(global.selected_tower)) {
            global.selected_tower.is_selected = false;
        }
    }
    global.selected_tower = noone;
    
    if (instance_exists(obj_UI_Panel_Upgrade)) {
        obj_UI_Panel_Upgrade.hide();
    }
}

// ADICIONE ESTA FUNÇÃO ABAIXO:
function tower_spawn(_x, _y, _object, _cost) {
    if (global.cash_amount >= _cost) {
        global.cash_amount -= _cost;
        
        // Cria a torre
        var _tower = instance_create_depth(_x, _y, -_y, _object);
        
        // --- VITAL PARA A VENDA ---
        _tower.my_slot_x = _x;        // Salva onde o slot estava
        _tower.my_slot_y = _y;        // Salva onde o slot estava
        _tower.total_invested = _cost; // Registra o primeiro gasto
        
        return _tower;
    }
    return noone;
}