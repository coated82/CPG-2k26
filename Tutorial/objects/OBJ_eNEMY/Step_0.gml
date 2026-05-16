if (global.pausado) {
    if (path_speed != 0) { speed_original = path_speed; path_speed = 0; }
    exit;
} else if (path_speed == 0) {
    path_speed = speed_original;
}

<<<<<<< Updated upstream
// ========== VERIFICA SE O POWER-UP S ESTÁ ATIVO ==========
if (global.powerup_s_ativo && path_speed != speed_current * global.speed_multiplier) {
    path_speed = speed_current * global.speed_multiplier;
}
if (!global.powerup_s_ativo && path_speed != speed_current) {
    path_speed = speed_current;
}

// Efeito visual de balanço (Wobble)
=======
>>>>>>> Stashed changes
image_angle = sin(current_time / 200) * 10;

// Sincroniza sinais
if (instance_exists(inst_minus_signal)) { inst_minus_signal.x = x; inst_minus_signal.y = y; }
if (instance_exists(inst_imaginary_signal)) { inst_imaginary_signal.x = x + 20; inst_imaginary_signal.y = y; }