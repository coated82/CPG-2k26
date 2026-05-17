// ============================================================================
//                          STEP - OBJ_TOWER_SUB
// ============================================================================

// 1. FILTRO DE ALVO INTELIGENTE
target = noone;
var _min_dist = range; 

// Percorre todos os inimigos para encontrar o alvo ideal
with (obj_Enemy_Parent) {
    // A Subtratora SÓ mira se: NÃO for negativo E NÃO for imaginário
    if (is_negative == false && is_imaginary == false && hit_points > 0) {
        var _dist = point_distance(other.x, other.y, x, y);
        
        // Se estiver dentro do raio e for o mais próximo até agora
        if (_dist < _min_dist) {
            _min_dist = _dist;
            other.target = id;
        }
    }
}

// 2. LÓGICA DE EXECUÇÃO (TIRO E APARÊNCIA)
if (instance_exists(target)) {
    // Direção exata para o alvo
    var _target_dir = point_direction(x, y, target.x, target.y);
    
    // Ajuste visual: +180 corrige sprites desenhados para a esquerda
    image_angle = _target_dir + 180; 

    // Disparo
    if (can_shoot) {
        // Garante que o nome do objeto está correto (obj_Bullet_Player)
        var _bullet = instance_create_depth(x, y, depth - 1, obj_Bullet_Player);
        
        _bullet.target = target;
        _bullet.damage = bullet_damage; // Passa o dano atualizado pelo upgrade
        _bullet.direction = _target_dir; 
        _bullet.image_angle = _target_dir;
        _bullet.speed = 12; 
        
        can_shoot = false;
        alarm[0] = fire_rate; // Alarme 0 reseta can_shoot para true
    }
} else {
    // Opcional: Se não houver alvo, a torre volta para o ângulo 0 lentamente
    image_angle = lerp(image_angle, 180, 0.05);
}