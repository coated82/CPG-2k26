// 1. WATCHDOG: Limpa o alvo se ele deixou de existir
if (!instance_exists(target)) target = noone;

// Bloqueia execução se o jogo estiver pausado
if (global.pausado) exit;

// 2. BUSCA DE SINAL: Procura o inimigo apenas se estiver sem alvo
if (target == noone) {
    var _inst = collision_circle(x, y, radius, obj_Enemy, false, true);
    
    // FILTRO PARA SOMADORA: Mira apenas em sinais NEGATIVOS (< 0)
    if (_inst != noone && _inst.hit_points < 0) {
        target = _inst;
    }
}

// 3. CICLO DE EXECUÇÃO: Atira se o alvo for válido
if (instance_exists(target)) {
    
    // CONDIÇÕES DE RESET: Perde o foco se o inimigo fugir ou se o sinal chegar a zero/positivo
    if (point_distance(x, y, target.x, target.y) > radius || target.hit_points >= 0) {
        target = noone;
    } 
    // GATILHO: Só dispara se a trava 'can_shoot' estiver liberada
    else if (can_shoot) {
        can_shoot = false; // Trava o gatilho imediatamente
        
        // RECARGA: Converte o valor de rate_of_fire em frames reais (FPS)
        alarm[0] = game_get_speed(gamespeed_fps) * rate_of_fire; 
        
        // SAÍDA: Cria o projétil específico da SOMA
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Sum);
        if (instance_exists(_bullet)) {
            _bullet.direction = point_direction(x, y, target.x, target.y);
            _bullet.speed = 10;
            _bullet.image_angle = _bullet.direction;
            
            // DANO: Passamos -1 para a matemática de soma (-3 - (-1) = -2)
            _bullet._damage = -1; 
        }
    }
}