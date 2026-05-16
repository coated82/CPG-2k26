// ========== SISTEMA DE PAUSA ==========
if (global.pausado) {
    if (path_speed != 0) { 
        speed_original_backup = path_speed; // Salva a velocidade exata do momento (lenta ou normal)
        path_speed = 0; 
    }
    exit;
} else if (path_speed == 0) {
    // Ao despausar, volta para o que era (lento ou normal)
    path_speed = speed_original_backup;
}

// ========== LOGICA DE MOVIMENTO E POWER-UPS ==========
// Só atualizamos a velocidade se não estiver sob efeito da Divisora
if (!is_slowed) {
    var _target_speed = speed_original;
    
    // Aplica multiplicador de power-up se ativo
    if (global.powerup_s_ativo) {
        _target_speed = speed_original * global.speed_multiplier;
    }
    
    if (path_speed != _target_speed) {
        path_speed = _target_speed;
    }
}

// Efeito visual de balanço
image_angle = sin(current_time / 200) * 10;

// Sincroniza sinais
if (instance_exists(inst_minus_signal)) { inst_minus_signal.x = x; inst_minus_signal.y = y; }
if (instance_exists(inst_imaginary_signal)) { inst_imaginary_signal.x = x + 20; inst_imaginary_signal.y = y; }