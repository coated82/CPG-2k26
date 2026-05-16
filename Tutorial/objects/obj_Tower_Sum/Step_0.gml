
// 1. Limpeza de Ponteiro (Segurança contra "alvos fantasm")
if (!instance_exists(target)) {
    target = noone;
}

// 2. Busca novo alvo se estiver vazio

if (global.pausado) exit;
// 1. Busca Alvo (Prioridade para quem é < 0)

if (target == noone) {
    var _inst = collision_circle(x, y, radius, obj_Enemy, false, true);
    if (_inst != noone) {
        // Filtro: Mira apenas se hit_points for negativo
        if (variable_instance_exists(_inst, "hit_points") && _inst.hit_points < 0) {
            target = _inst;
        }
    }
}

// 3. Lógica de Disparo
if (instance_exists(target)) {
    // Perda de foco se fugir ou se tornar positivo (hit_points >= 0)
    if (point_distance(x, y, target.x, target.y) > radius || target.hit_points >= 0) {
        target = noone;
    } else if (can_shoot) {
        can_shoot = false;
        
        // Reset via Alarm 0 (Padrão clonado da Subtratora)
        alarm[0] = rate_of_fire; 
        
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Sum);
        _bullet.direction = point_direction(x, y, target.x, target.y);
        _bullet.speed = 12;
        _bullet.image_angle = _bullet.direction;
        _bullet._damage = bullet_damage;
    }
}