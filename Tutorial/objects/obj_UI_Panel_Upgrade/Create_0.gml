// Informações de exibição
tower_name = "";
tower_level = 0;
tower_damage = 0;
tower_update_cost = 0;

// Configurações de Posição (ajuste os valores se sua tela for diferente)
position_hidden_y = 896; 
position_shown_y = 736;
position_current_x = 608;
position_current_y = position_hidden_y;

x = position_current_x;
y = position_hidden_y;
visible = false;

// Criar botões e armazenar referências
var _depth = depth - 1;

instance_btn_close = instance_create_depth(x, y, _depth, obj_UI_Close_Upgrade);
instance_btn_close.parent = id;

instance_btn_purchase = instance_create_depth(x, y, _depth, obj_UI_Purchase_Upgrade);
instance_btn_purchase.parent = id;

// Funções de controle
show = function() {
    visible = true;
    position_current_y = position_shown_y;
}

hide = function() {
    position_current_y = position_hidden_y;
}