// Info da Torre (Preenchidas pelo script tower_select)
tower_name = "default tower";
tower_level = 1;
tower_damage = 0;
tower_update_cost = 0;

// Posições de Esconder/Mostrar
position_hidden_x = 608;
position_hidden_y = 896;
position_shown_x = 608;
position_shown_y = 736;

// Estado Inicial
position_current_x = position_hidden_x;
position_current_y = position_hidden_y;
x = position_hidden_x;
y = position_hidden_y;
visible = false;

var _layer_depth = depth - 1;

// Criar Botão de Fechar (X)
instance_btn_close = instance_create_depth(x, y, _layer_depth, obj_UI_Close_Upgrade);
instance_btn_close.parent = id;

// Criar Botão de Upgrade (Seta)
instance_btn_purchase = instance_create_depth(x, y, _layer_depth, obj_UI_Purchase_Upgrade);
instance_btn_purchase.parent = id;

// Funções de controle
hide = function(){
    position_current_x = position_hidden_x;
    position_current_y = position_hidden_y;
}

show = function() {
    visible = true; 
    position_current_x = position_shown_x;
    position_current_y = position_shown_y;
}