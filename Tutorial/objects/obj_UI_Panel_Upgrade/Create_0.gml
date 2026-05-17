// --- Informações de exibição ---
tower_name = "";
tower_level = 0;
tower_damage = 0;
tower_update_cost = 0;
selected_tower = noone;

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

// NOVO: Botão de Venda
instance_btn_sell = instance_create_depth(x, y, _depth, obj_UI_Sell_Button);
instance_btn_sell.parent = id;

// --- Funções de controle ---
show = function(_inst) {
    if (!instance_exists(_inst)) return;

    selected_tower = _inst; 
    visible = true;
    position_current_y = position_shown_y;
    
    tower_name = _inst.name;
    tower_level = _inst.level;
    tower_damage = _inst.damage;
    tower_update_cost = _inst.upgrade_cost;
    
    // Notifica os botões sobre qual torre estamos olhando
    instance_btn_purchase.target_tower = _inst;
    instance_btn_sell.target_tower = _inst;
}

hide = function() {
    position_current_y = position_hidden_y;
    selected_tower = noone;
}