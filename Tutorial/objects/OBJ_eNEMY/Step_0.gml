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

// Efeito visual de balanço (Wobble)
image_angle = sin(current_time / 200) * 10;

// ========== SINCRONIZAÇÃO DOS SINAIS (CORRIGIDO) ==========

// Sincroniza a posição do sinal de menos
if (instance_exists(inst_minus_signal)) {
    inst_minus_signal.x = x;
    inst_minus_signal.y = y;
}

// Sincroniza a posição do sinal imaginário "i"
if (instance_exists(inst_imaginary_signal)) {
    // Mantém o deslocamento de +20 para não sobrepor o número
    inst_imaginary_signal.x = x + 20; 
    inst_imaginary_signal.y = y;
}