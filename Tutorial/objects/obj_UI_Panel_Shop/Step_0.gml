 x = lerp(x, position_current_x, 0.06);
 y = lerp(y, position_current_y, 0.06);
 
 if (instance_exists(instance_button_close)) {
    instance_button_close.x = x;
    instance_button_close.y = y + 350;
}