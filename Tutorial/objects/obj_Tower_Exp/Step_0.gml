if (global.pausado) exit;

// 1. WATCHDOG: Limpa o alvo se ele deixou de existir
if (!instance_exists(target)) target = noone;

if (global.pausado) exit;

// 2. BUSCA DE SINAL: Mira EXCLUSIVAMENTE em imaginários
if (target == noone) {
    var _inst = collision_circle(x, y, radius, obj_Enemy, false, true);
    
    // FILTRO EXPONENCIAL: Só "enxerga" se is_imaginary for TRUE
    if (_inst != noone && _inst.is_imaginary) {
        target = _inst;
    }
}

// 3. CICLO DE DISPARO
if (instance_exists(target)) {
    
    // Perde o alvo se ele fugir ou se DEIXAR de ser imaginário (já foi convertido)
    if (point_distance(x, y, target.x, target.y) > radius || !target.is_imaginary) {
        target = noone;
    } 
    else if (can_shoot) {
        can_shoot = false; 
        alarm[0] = game_get_speed(gamespeed_fps) * rate_of_fire; 
        
        // Criar o projétil exponencial
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Exp);
        if (instance_exists(_bullet)) {
            _bullet.target = target; // Passa o alvo para a bala seguir
            _bullet.direction = point_direction(x, y, target.x, target.y);
            _bullet.speed = 12;
            _bullet.image_angle = _bullet.direction;
        }
    }
}