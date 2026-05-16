if (global.pausado) exit;
// 1. Procura alvo se estiver vazio
if (target == noone) {
    target = collision_circle(x, y, radius, obj_Enemy, false, true);
}

// 2. Se o alvo existe, atira
if (instance_exists(target)) {
    // Se o alvo fugir, perde o foco
    if (point_distance(x, y, target.x, target.y) > radius) {
        target = noone;
    } else if (can_shoot) {
        can_shoot = false;
        
        // Ativa o alarme de recarga (Certifique-se que o Alarm 2 tem can_shoot = true)
        alarm[2] = game_get_speed(gamespeed_fps) * rate_of_fire;
        
        // Criar a bala
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Player);
        _bullet.direction = point_direction(x, y, target.x, target.y);
        _bullet.speed = 10;
        _bullet.image_angle = _bullet.direction;
        _bullet._damage = bullet_damage;
		
    }
} else {
    target = noone;
}