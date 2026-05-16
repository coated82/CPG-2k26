// Posições
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

// Criar Elementos da UI (Usando os objetos da pasta UI)
instance_button_close = instance_create_depth(x, y, _layer_depth, obj_UI_Close);
instance_button_close.parent = id;

instance_tower_machinegun = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Machinegun);
instance_tower_machinegun.parent = id;

instance_tower_bomb = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Bomb);
instance_tower_bomb.parent = id;

instance_tower_slow = instance_create_depth(x, y, _layer_depth, obj_UI_Tower_Slow);
instance_tower_slow.parent = id;

// Funções
hide = function(){
    position_current_x = position_hidden_x;
    position_current_y = position_hidden_y;
}

show = function() {
    visible = true; 
    position_current_x = position_shown_x;
    position_current_y = position_shown_y;
}