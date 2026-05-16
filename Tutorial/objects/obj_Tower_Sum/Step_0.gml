// 1. WATCHDOG: Limpa o alvo se ele deixou de existir
if (!instance_exists(target)) target = noone;

// Bloqueia execução se o jogo estiver pausado
if (global.pausado) exit;

// 2. BUSCA DE SINAL (ALU FILTER)
if (target == noone) {
    var _inst = collision_circle(x, y, radius, obj_Enemy, false, true);
    
    // CORREÇÃO: Adicionado o check de !is_imaginary
    // A Somadora agora ignora quem tem o componente "i"
    if (_inst != noone && !_inst.is_imaginary && _inst.hit_points < 0) {
        target = _inst;
    }
}

// 3. CICLO DE EXECUÇÃO
if (instance_exists(target)) {
    
    // CONDIÇÕES DE RESET: Perde o foco se o inimigo fugir, se o sinal mudar ou se virar imaginário
    if (point_distance(x, y, target.x, target.y) > radius || target.hit_points >= 0 || target.is_imaginary) {
        target = noone;
    } 
    
    // GATILHO
    else if (can_shoot) {
        can_shoot = false; 
        
        alarm[0] = game_get_speed(gamespeed_fps) * rate_of_fire; 
        
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Sum);
        if (instance_exists(_bullet)) {
            _bullet.direction = point_direction(x, y, target.x, target.y);
            _bullet.speed = 10;
            _bullet.image_angle = _bullet.direction;
            
            // DANO: -1 na subtratora interna do inimigo (-3 - (-1) = -2)
            _bullet._damage = -1; 
        }
    }
}