if (global.pausado) exit;
// 1. Busca Alvo (Prioridade para quem é < 0)
event_inherited();
/*
if (target == noone) {
    var _enemy = instance_nearest(x, y, obj_Enemy); // Ou seu sistema de detecção
    if (_enemy != noone && point_distance(x, y, _enemy.x, _enemy.y) <= radius) {
        if (_enemy.valor < 0) { // SÓ foca se for negativo
            target = _enemy;
        }
    }
}

// 2. Executa o Tiro
if (instance_exists(target)) {
    // Se o alvo morreu, ficou positivo ou saiu do raio, perde o foco
    if (point_distance(x, y, target.x, target.y) > radius || target.valor >= 0) {
        target = noone;
    } else if (can_shoot) {
        can_shoot = false;
        alarm[2] = rate_of_fire;
        
        // Cria a bala de SOMA
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Sum);
        _bullet.direction = point_direction(x, y, target.x, target.y);
        _bullet.speed = 10;
        _bullet._damage = bullet_damage;
        
        // play_audio(snd_Shoot_Sum); // Se você tiver um som específico
    }
}
*/