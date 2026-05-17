// ========== SISTEMA DE PAUSA ==========
if (global.pausado) {
    if (path_speed != 0) { 
        speed_original_backup = path_speed; 
        path_speed = 0; 
    }
    exit;
} else if (path_speed == 0) {
    path_speed = speed_original_backup;
}

// ========== LÓGICA DE REGENERAÇÃO (1.5s) ==========
if (!dying) {
    if (hit_points < hp_max) {
        regen_timer += 1;
        
        if (regen_timer >= regen_delay) {
            hit_points += heal_amount;
            if (hit_points > hp_max) hit_points = hp_max; 
            
            change_num(); 
            regen_timer = 0;
        }
    } else {
        regen_timer = 0; 
    }
}

// ========== MOVIMENTAÇÃO ==========
if (!is_slowed) {
    var _target_speed = speed_original;
    if (global.powerup_s_ativo) {
        _target_speed = speed_original * global.speed_multiplier;
    }
    if (path_speed != _target_speed) {
        path_speed = _target_speed;
    }
}

image_angle = sin(current_time / 200) * 10;