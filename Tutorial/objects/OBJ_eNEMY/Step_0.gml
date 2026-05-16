// ========== SISTEMA DE PAUSA ==========
if (global.pausado) {
    // Se estiver pausado e o path estiver rodando, para ele
    if (path_position > 0) {
        path_pause = true;  // Salva que estava rodando
        path_speed = 0;      // Zera a velocidade do path
    }
    exit;
} else {
    // Se não estiver pausado e estava pausado, retoma
    if (path_pause) {
        path_speed = speed_current;  // Volta a velocidade original
        path_pause = false;
    }
}

image_angle = sin(current_time / 200) * 10;