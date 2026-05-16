var _me = id;

with (obj_Enemy) {
    if (point_distance(x, y, _me.x, _me.y) <= _me.radius) {
        if (is_imaginary) {
            is_imaginary = false;
            change_num(); 
            effect_create_above(ef_spark, x, y, 1, c_aqua);
        }
    }
}

effect_create_above(ef_ring, x, y, 2, c_blue);

// Limpeza de segurança para a UI
if (global.selected_tower == id) {
    global.selected_tower = noone;
}

instance_destroy();