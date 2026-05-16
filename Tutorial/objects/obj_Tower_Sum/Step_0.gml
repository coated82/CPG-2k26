// 1. Procura alvo se estiver vazio (Filtro para Negativos)
if (target == noone || !instance_exists(target)) {
    target = noone; // Limpa o ponteiro antes de buscar novo
    var _inst = collision_circle(x, y, radius, obj_Enemy, false, true);
    
    if (_inst != noone && instance_exists(_inst)) {
        if (variable_instance_exists(_inst, "hit_points") && _inst.hit_points < 0) {
            target = _inst;
        }
    }
}

// 2. Se o alvo existe, atira
if (instance_exists(target)) {
    // Perda de foco se o alvo fugir ou for resolvido (virar positivo)
    if (point_distance(x, y, target.x, target.y) > radius || target.hit_points >= 0) {
        target = noone;
    } else if (can_shoot) {
        can_shoot = false;
        
        // Ativa o alarme de recarga (Certifique-se que o ALARM 0 tem can_shoot = true)
        alarm[0] = rate_of_fire;
        
        // Criar a bala de SOMA
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Sum);
        _bullet.direction = point_direction(x, y, target.x, target.y);
        _bullet.speed = 12;
        _bullet.image_angle = _bullet.direction;
        _bullet._damage = bullet_damage;
    }
}