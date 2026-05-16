if (global.pausado) exit;
if(!can_shoot){
    return;
}

var _ds_enemies = ds_list_create();
var _num = collision_circle_list(x, y, radius, obj_Enemy, false, true, _ds_enemies, false);

if(_num > 0) {
    for (var i = 0; i < clamp(_num, 0, 10); i++){
        _ds_enemies[| i].hurt(bullet_damage);
    }
    
    alarm_set(2, rate_of_fire * room_speed);
    can_shoot = false;
}

ds_list_destroy(_ds_enemies);