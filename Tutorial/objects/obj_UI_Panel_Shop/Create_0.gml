// Coordenadas de Posição (Slide Lateral)
position_hidden_x = 1504;
position_hidden_y = 320;
position_shown_x = 1248;
position_shown_y = 320;

// Estado Inicial
position_current_x = position_hidden_x;
position_current_y = position_hidden_y;
x = position_hidden_x;
y = position_hidden_y;
visible = false;

var _layer_depth = depth - 1;

// Criar Elementos da UI (Instanciação)
instance_button_close = instance_create_depth(x, y, _layer_depth, obj_UI_Close);
instance_button_close.parent = id;

instance_tower_sub = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Sub);
instance_tower_sub.parent = id;

instance_tower_bomb = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Bomb);
instance_tower_bomb.parent = id;

instance_tower_div = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Div);
instance_tower_div.parent = id;

instance_tower_sum = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Sum);
instance_tower_sum.parent = id;

instance_tower_mult = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Mult);
instance_tower_mult.parent = id;

// Funções de Controle
hide = function(){
    position_current_x = position_hidden_x;
}

show = function() {
    visible = true; 
    position_current_x = position_shown_x;
}