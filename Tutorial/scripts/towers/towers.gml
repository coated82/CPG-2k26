function tower_select(_tower) {
    // 1. Deseleciona qualquer torre anterior
    tower_deselect();
    
    // 2. Define a nova torre selecionada
    global.selected_tower = _tower;
    
    // Verifica se a instância existe para evitar erros
    if (instance_exists(global.selected_tower)) {
        global.selected_tower.is_selected = true;
    	
        // 3. Avisa o Painel para aparecer, passando a torre como argumento
        if (instance_exists(obj_UI_Panel_Upgrade)) {
            // Chamamos apenas o show passando a torre. 
            // O próprio show() agora cuida de preencher o nome, level, etc.
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
    
    // Esconde o painel se ele existir
    if (instance_exists(obj_UI_Panel_Upgrade)) {
        obj_UI_Panel_Upgrade.hide();
    }
}