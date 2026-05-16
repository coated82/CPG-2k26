function tower_select(_tower) {
    tower_deselect();
    
    global.selected_tower = _tower;
    global.selected_tower.is_selected = true;
	
    // Passa os dados para o painel de upgrade
    if (instance_exists(obj_UI_Panel_Upgrade)) {
        obj_UI_Panel_Upgrade.tower_name = global.selected_tower.name;
        obj_UI_Panel_Upgrade.tower_level = global.selected_tower.level;
        obj_UI_Panel_Upgrade.tower_damage = global.selected_tower.bullet_damage;
        // Sincronizado com o nome que você definiu no Create
        obj_UI_Panel_Upgrade.tower_update_cost = global.selected_tower.upgrade_price;
        
        obj_UI_Panel_Upgrade.show();
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