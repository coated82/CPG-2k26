// 1. WATCHDOG: Validação do Alvo
if (!instance_exists(target)) {
    target = noone;
} else {
    var _dist = point_distance(x, y, target.x, target.y);
    // PERDA DE ALVO: Se fugir do raio OU se morrer OU se NÃO for negativo OU se virou imaginário
    if (_dist > radius || target.hit_points <= 0 || !target.is_negative || target.is_imaginary) {
        target = noone;
    }
}

if (global.pausado) exit;

// 2. BUSCA ATIVA: Só enxerga NEGATIVOS (is_negative)
if (target == noone) {
    var _range = radius;
    var _me = id;
    var _max_progress = -1;
    with (obj_Enemy) {
        if (point_distance(x, y, _me.x, _me.y) <= _range && is_negative && !is_imaginary && hit_points > 0) {
            if (path_position > _max_progress) {
                _max_progress = path_position;
                _me.target = id;
            }
        }
    }
}

// 3. DISPARO
if (target != noone && can_shoot) {
    can_shoot = false;
    alarm[0] = game_get_speed(gamespeed_fps) * rate_of_fire;
    
    var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Sum);
    if (instance_exists(_bullet)) {
        _bullet.direction = point_direction(x, y, target.x, target.y);
        _bullet.speed = 10;
        _bullet._damage = bullet_damage;
        _bullet.source_tower_name = name; // Deve ser "Somadora"
    }
}