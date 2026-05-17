// 1. WATCHDOG: Validação do Alvo
if (instance_exists(target)) {
    var _dist = point_distance(x, y, target.x, target.y);
    // PERDA DE ALVO: Se fugir do raio, morrer, virar positivo ou imaginário
    if (_dist > range || target.hit_points <= 0 || !target.is_negative || target.is_imaginary) {
        target = noone;
    }
} else {
    target = noone;
}

if (global.pausado) exit;

// 2. BUSCA ATIVA (Prioriza quem está mais longe no caminho)
if (target == noone) {
    var _me = id;
    var _max_progress = -1;
    with (obj_Enemy) { 
        if (point_distance(x, y, _me.x, _me.y) <= _me.range && is_negative && !is_imaginary && hit_points > 0) {
            if (path_position > _max_progress) {
                _max_progress = path_position;
                _me.target = id;
            }
        }
    }
}

// 3. DISPARO E APARÊNCIA
if (instance_exists(target)) {
    // Virar para o alvo
    var _dir = point_direction(x, y, target.x, target.y);
    image_angle = _dir; 

    if (can_shoot) {
        can_shoot = false;
        alarm[0] = fire_rate; 
        
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Sum);
        if (instance_exists(_bullet)) {
            _bullet.direction = _dir;
            _bullet.image_angle = _dir;
            _bullet.speed = 12;
            
            // CORREÇÃO: Passa a variável 'damage' que é atualizada pelo Script de Upgrade
            _bullet.damage = damage; 
            
            _bullet.target = target;
        }
    }
}