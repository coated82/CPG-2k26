if (global.pausado) exit;

// Garante que a escala não mude (bug do sprite gigante)
image_xscale = 0.15;
image_yscale = 0.15;

// 1. BUSCA DE ALVO (Sua lógica de priorizar is_slowed == false está ótima)
target = noone;
var _min_dist = range;

with (obj_Enemy_Parent) {
    var _dist_to_tower = point_distance(x, y, other.x, other.y);
    if (_dist_to_tower <= _min_dist && hit_points > 0 && is_slowed == false) {
        _min_dist = _dist_to_tower;
        other.target = id;
    }
}

// Fallback: busca o mais próximo se todos já estiverem lentos
if (target == noone) {
    var _near = instance_nearest(x, y, obj_Enemy_Parent);
    if (instance_exists(_near)) {
        if (point_distance(x, y, _near.x, _near.y) <= range) target = _near;
    }
}

// 2. LÓGICA DE TIRO
if (instance_exists(target)) {
    var _dir = point_direction(x, y, target.x, target.y);
    image_angle = _dir;

    if (can_shoot) {
        can_shoot = false;
        alarm[0] = fire_rate; 

        // Tiro Principal
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Slow);
        if (instance_exists(_bullet)) {
            _bullet.target = target;
            _bullet.slow_amount = slow_power;
            _bullet.direction = _dir;
            _bullet.speed = 10;
        }

        // 3. TIROS EXTRAS
        var _count = 0;
        with (obj_Enemy_Parent) {
            if (id != other.target && point_distance(x, y, other.x, other.y) <= other.range && is_slowed == false) {
                if (_count < other.extra_targets) {
                    var _b = instance_create_depth(other.x, other.y, other.depth - 1, obj_Bullet_Slow);
                    _b.target = id;
                    _b.slow_amount = other.slow_power;
                    _b.direction = point_direction(other.x, other.y, x, y);
                    _b.speed = 10;
                    _count++;
                }
            }
        }
    }
}