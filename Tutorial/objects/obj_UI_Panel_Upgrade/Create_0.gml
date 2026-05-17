// --- Informações de exibição ---
tower_name = "";
tower_level = 0;
tower_damage = 0;
tower_update_cost = 0;
selected_tower = noone; // Referência para a torre no mapa

// --- Configurações de Posição ---
position_hidden_y = 896; 
position_shown_y = 736;
position_current_x = 608;
position_current_y = position_hidden_y;

x = position_current_x;
y = position_hidden_y;
visible = false;

// --- Criar botões e armazenar referências ---
var _depth = depth - 1;

instance_btn_close = instance_create_depth(x, y, _depth, obj_UI_Close_Upgrade);
instance_btn_close.parent = id;

instance_btn_purchase = instance_create_depth(x, y, _depth, obj_UI_Purchase_Upgrade);
instance_btn_purchase.parent = id;

// --- Funções de controle ---
// No Create do obj_UI_Panel_Upgrade
show = function(_inst) {
    // Segurança: Se por algum motivo _inst for nulo, não executa
    if (!instance_exists(_inst)) return;

    selected_tower = _inst; 
    visible = true;
    position_current_y = position_shown_y;
    
    // Agora o _inst existe, então podemos ler o .name sem crashar
    tower_name = _inst.name;
    tower_level = _inst.level;
    tower_damage = _inst.damage;
    tower_update_cost = _inst.upgrade_cost;
}

hide = function() {
    position_current_y = position_hidden_y;
    selected_tower = noone;
}