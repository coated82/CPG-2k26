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
    if (global.powerup_k_disponivel) {
        // === MATA TODOS OS INIMIGOS ===
        with (obj_Enemy) {  // Use o nome do seu objeto pai dos inimigos
            instance_destroy();
        }
        
        // Inicia o cooldown (sem estado "ativo")
        global.powerup_k_disponivel = false;
        global.powerup_k_cooldown = global.powerup_k_cooldown_total * room_speed;
        
        show_debug_message("POWER-UP K ATIVADO! Cooldown de " + string(global.powerup_k_cooldown_total) + " segundos");
    }
}
// ========== COOLDOWN DO POWER-UP K ==========
if (!global.powerup_k_disponivel) {
    global.powerup_k_cooldown--;
    if (global.powerup_k_cooldown <= 0) {
        global.powerup_k_disponivel = true;
        show_debug_message("Power-Up K pronto para usar novamente!");
    }
}

// ========== POWER-UP S (Ctrl + S) ==========
if (keyboard_check_pressed(ord("S")) && keyboard_check(vk_control)) {
    if (global.powerup_s_disponivel && !global.powerup_s_ativo) {
        // Ativa o power-up
        global.powerup_s_ativo = true;
        global.powerup_s_timer = global.powerup_s_tempo_total * room_speed;
        global.powerup_s_disponivel = false;
        global.speed_multiplier = 0.4;
        
        // Aplica a velocidade lenta em TODOS os inimigos
        with (obj_Enemy) {
            path_speed = speed_current * global.speed_multiplier;
        }
        
        show_debug_message("POWER-UP S ATIVADO! Cooldown de " + string(global.powerup_s_cooldown_total) + " segundos");
    } else if (!global.powerup_s_disponivel) {
        show_debug_message("Power-Up S em cooldown! Aguarde " + string(ceil(global.powerup_s_cooldown / room_speed)) + " segundos");
    }
}

// ========== GERENCIA O TIMER DO POWER-UP S ==========
if (global.powerup_s_ativo) {
    global.powerup_s_timer--;
    
    if (global.powerup_s_timer <= 0) {
        global.powerup_s_ativo = false;
        global.speed_multiplier = 1;
        
        // Restaura a velocidade normal
        with (obj_Enemy) {
            path_speed = speed_current;
        }
        
        // Inicia o cooldown
        global.powerup_s_cooldown = global.powerup_s_cooldown_total * room_speed;
        show_debug_message("Power-Up S finalizado! Cooldown de " + string(global.powerup_s_cooldown_total) + " segundos");
    }
}

// ========== COOLDOWN DO POWER-UP S ==========
if (!global.powerup_s_disponivel && !global.powerup_s_ativo) {
    global.powerup_s_cooldown--;
    if (global.powerup_s_cooldown <= 0) {
        global.powerup_s_disponivel = true;
        show_debug_message("Power-Up S pronto para usar novamente!");
    }
}

// ========== POWER-UP COPY (Ctrl+C) - Copia o dinheiro atual ==========
if (keyboard_check_pressed(ord("C")) && keyboard_check(vk_control)) {
    if (global.powerup_copy_disponivel) {
        // Copia o dinheiro atual
        global.dinheiro_copiado = global.cash_amount;  // Use sua variável de dinheiro
        
        // Inicia cooldown da cópia
        global.powerup_copy_disponivel = false;
        global.powerup_copy_cooldown = global.powerup_copy_cooldown_total * room_speed;
        
        // Feedback visual (opcional)
        show_debug_message("💰 DINHEIRO COPIADO: " + string(global.dinheiro_copiado) + " 💰");
        
        // Efeito sonoro (opcional)
        // audio_play_sound(snd_copy, 0, false);
    } else {
        show_debug_message("⏳ Ctrl+C em cooldown! Aguarde " + string(ceil(global.powerup_copy_cooldown / room_speed)) + " segundos");
    }
}

// ========== POWER-UP PASTE (Ctrl+V) - Cola o dinheiro copiado ==========
if (keyboard_check_pressed(ord("V")) && keyboard_check(vk_control)) {
    if (global.powerup_paste_disponivel) {
        if (global.dinheiro_copiado > 0) {
            // Soma o dinheiro copiado ao atual
            global.cash_amount += global.dinheiro_copiado;
            
            // ZERA O DINHEIRO COPIADO (obriga a copiar de novo)
            var _valor_colado = global.dinheiro_copiado;
            global.dinheiro_copiado = 0;
            
            // Inicia cooldown da colagem
            global.powerup_paste_disponivel = false;
            global.powerup_paste_cooldown = global.powerup_paste_cooldown_total * room_speed;
            
            // Feedback visual
            show_debug_message("💵 DINHEIRO COLADO: +" + string(_valor_colado) + " 💵");
            show_debug_message("💰 TOTAL AGORA: " + string(global.cash_amount) + " 💰");
            show_debug_message("📋 ÁREA DE TRANSFERÊNCIA LIMPA! Use Ctrl+C para copiar novamente.");
            
            // Efeito sonoro (opcional)
            // audio_play_sound(snd_paste, 0, false);
        } else {
            show_debug_message("⚠️ Nada copiado! Use Ctrl+C primeiro!");
        }
    } else {
        show_debug_message("⏳ Ctrl+V em cooldown! Aguarde " + string(ceil(global.powerup_paste_cooldown / room_speed)) + " segundos");
    }
}

// ========== COOLDOWN DO COPY ==========
if (!global.powerup_copy_disponivel) {
    global.powerup_copy_cooldown--;
    if (global.powerup_copy_cooldown <= 0) {
        global.powerup_copy_disponivel = true;
        show_debug_message("✅ Ctrl+C pronto para usar novamente!");
    }
}

// ========== COOLDOWN DO PASTE ==========
if (!global.powerup_paste_disponivel) {
    global.powerup_paste_cooldown--;
    if (global.powerup_paste_cooldown <= 0) {
        global.powerup_paste_disponivel = true;
        show_debug_message("✅ Ctrl+V pronto para usar novamente!");
    }
}