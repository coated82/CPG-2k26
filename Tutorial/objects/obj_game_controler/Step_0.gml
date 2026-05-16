// ========== COMANDO GLOBAL DE PAUSA (Ctrl+P) ==========
if (keyboard_check_pressed(ord("P")) && keyboard_check(vk_control)) {
    global.pausado = !global.pausado;
    
    // Debug
    if (global.pausado) {
        show_debug_message("Jogo Pausado Globalmente");
    } else {
        show_debug_message("Jogo Retomado");
    }
}

// ========== SAIR COM ESC (quando pausado) ==========
if (global.pausado && keyboard_check_pressed(vk_escape)) {
    global.pausado = false;
    room_goto(rm_Menu);
}

// ========== POWER-UP K (Ctrl + K) ==========
if (keyboard_check_pressed(ord("K")) && keyboard_check(vk_control)) {
    if (global.powerup_k_disponivel && !global.powerup_k_ativo) {
        // Ativa o power-up
        global.powerup_k_ativo = true;
        global.powerup_k_timer = global.powerup_k_tempo_total * room_speed; // Converte pra frames
        global.powerup_k_disponivel = false;
        
        // === MATA TODOS OS INIMIGOS ===
        with (obj_Enemy) {  // Use o nome do seu objeto pai dos inimigos
            instance_destroy();
        }
        
        // Ou se não tiver objeto pai, use o nome específico:
        // with (obj_inimigo) instance_destroy();
        // with (obj_inimigo2) instance_destroy();
        
        // Efeito sonoro (opcional)
        // audio_play_sound(snd_powerup, 0, false);
        
        // Mostra no console
        show_debug_message("POWER-UP K ATIVADO! Todos os inimigos eliminados!");
    }
}

// ========== GERENCIA O TIMER DO POWER-UP ==========
if (global.powerup_k_ativo) {
    global.powerup_k_timer--;
    
    if (global.powerup_k_timer <= 0) {
        // Acabou o power-up
        global.powerup_k_ativo = false;
        global.powerup_k_disponivel = true;
        show_debug_message("Power-Up K finalizado!");
    }
}

// Cooldown (opcional - pra não usar toda hora)
if (!global.powerup_k_disponivel && !global.powerup_k_ativo) {
    global.powerup_k_cooldown--;
    if (global.powerup_k_cooldown <= 0) {
        global.powerup_k_disponivel = true;
        global.powerup_k_cooldown = 0;
    }
}