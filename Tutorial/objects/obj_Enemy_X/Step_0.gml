// ========== SISTEMA DE PAUSA ==========
if (global.pausado) {
    if (path_speed != 0) { 
        // Salva a velocidade exata do momento (seja ela lenta pela divisora ou normal)
        speed_original_backup = path_speed; 
        path_speed = 0; 
    }
    exit;
} else if (path_speed == 0) {
    // Ao despausar, volta para a velocidade que estava antes da pausa
    path_speed = speed_original_backup;
}

// ========== LÓGICA DE MOVIMENTO E POWER-UPS ==========
// Só atualizamos a velocidade se não estiver sob efeito da torre Divisora (is_slowed)
if (!is_slowed) {
    var _target_speed = speed_original;
    
    // Aplica multiplicador de power-up global se estiver ativo
    if (global.powerup_s_ativo) {
        _target_speed = speed_original * global.speed_multiplier;
    }
    
    // Aplica a velocidade ao path apenas se houver mudança
    if (path_speed != _target_speed) {
        path_speed = _target_speed;
    }
}

// ========== EFEITO VISUAL ==========
// Mantém o balanço característico dos inimigos, mas o Boss X é mais pesado/lento
image_angle = sin(current_time / 300) * 8; 

// --- OBSERVAÇÃO ---
// Removida a sincronização de sinais (inst_minus_signal e inst_imaginary_signal)
// O Boss X não precisa atualizar a posição desses objetos porque ele não os cria.