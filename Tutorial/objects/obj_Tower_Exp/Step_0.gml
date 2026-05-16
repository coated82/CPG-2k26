// 1. WATCHDOG: Validação do Alvo
if (!instance_exists(target)) {
    target = noone;
} else {
    var _dist = point_distance(x, y, target.x, target.y);
    // CRÍTICO: Perde o alvo se ele fugir do range OU se DEIXAR de ser imaginário
    // (Isso evita que a torre continue gastando munição em quem já virou Real)
    if (_dist > radius || !target.is_imaginary) {
        target = noone;
    }
}

// Bloqueia execução se o jogo estiver pausado
if (global.pausado) exit;

// 2. BUSCA ATIVA: Filtro Passa-Imaginário
if (target == noone) {
    var _range = radius;
    var _me = id;
    
    // Varredura para encontrar apenas quem tem o componente "i"
    with (obj_Enemy) {
        if (point_distance(x, y, _me.x, _me.y) <= _range) {
            if (is_imaginary == true) { // Foco total no imaginário
                _me.target = id;
                break; 
            }
        }
    }
}

// 3. DISPARO
if (target != noone && can_shoot) {
    can_shoot = false;
    
    // Recarga baseada no rate_of_fire da torre
    alarm[0] = game_get_speed(gamespeed_fps) * rate_of_fire; 
    
    // Cria o projétil da Exponencial (ex: obj_Bullet_Exp)
    var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Exp);
    if (instance_exists(_bullet)) {
        _bullet.target = target; // Passa a referência para a bala
        _bullet.direction = point_direction(x, y, target.x, target.y);
        _bullet.speed = 12;
        _bullet.image_angle = _bullet.direction;
    }
}