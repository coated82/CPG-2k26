// hidden position
position_hidden_x = 1504;
position_hidden_y = 320;

// shown position
position_shown_x = 1248;
position_shown_y = 320;

// Current
position_current_x = position_hidden_x;
position_current_y = position_hidden_y;

// Position now
x = position_hidden_x;
y = position_hidden_y;

instance_button_close = instance_create_depth(x, y, depth - 1, obj_UI_Close);
instance_button_close.parent = id;

//function

hide = function(){
	position_current_x = position_hidden_x;
	position_current_y = position_hidden_y;
}


show = function() {
    position_current_x = position_shown_x;
    position_current_y = position_shown_y;
}