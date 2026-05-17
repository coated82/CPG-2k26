// ============================================================================
//                          SISTEMA DE PAUSA MODIFICADO
// ============================================================================

// Pause normal (Ctrl+P) - só funciona se não estiver em pré-fase
if (global.tipo_pausa == 0) {
    if (keyboard_check_pressed(ord("P")) && keyboard_check(vk_control)) {
        global.pausado = !global.pausado;
        if (global.pausado) {
            show_debug_message("Jogo Pausado");
        } else {
            show_debug_message("Jogo Retomado");
        }
    }
}

// Lógica da contagem regressiva (tipo_pausa = 2)
if (global.tipo_pausa == 2) {
    global.pausado = true;  // Força o jogo a ficar pausado
    
    // Timer da contagem
    if (global.contagem_timer > 0) {
        global.contagem_timer--;
    } else {
        // Avança para o próximo número
        global.contagem_valor--;
        
        if (global.contagem_valor >= 1) {
            // Reinicia o timer para o próximo número
            global.contagem_timer = room_speed;  // 1 segundo
        } else {
            // Contagem terminou - começa o jogo
            global.tipo_pausa = 0;  // Volta ao modo normal
            global.pausado = false;  // Despausa
            global.contagem_valor = 3;  // Reseta para a próxima vez
            show_debug_message("COMEÇOU!");
        }
    }
}

// Sair com ESC (só no pause normal)
if (global.pausado && global.tipo_pausa == 0) {
    if (keyboard_check_pressed(vk_escape)) {
        global.pausado = false;
        room_goto(rm_Menu);
    }
}

// ============================================================================
//                          PRÉ-FASE (Ctrl + Alt + M)
// ============================================================================
if (global.tipo_pausa == 1) {
    global.pausado = true;  // Força o jogo a ficar pausado
    
    // Verifica Ctrl + Alt + M para começar
    if (keyboard_check_pressed(ord("M")) && keyboard_check(vk_control) && keyboard_check(vk_alt)) {
        // Muda para modo de contagem regressiva
        global.tipo_pausa = 2;
        global.contagem_valor = 3;
        global.contagem_timer = room_speed;  // 1 segundo para cada número
        show_debug_message("INICIANDO CONTAGEM...");
    }
}

// Se estiver pausado por qualquer motivo, não executa o resto do jogo
if (global.pausado) {
    exit;
}

// ============================================================================
//     SE CHEGOU AQUI, É PORQUE NÃO ESTÁ PAUSADO! TUDO ABAIXO RODA NORMAL
// ============================================================================

// ============================================================================
//                          POWER-UP COPY (Ctrl+C)
// ============================================================================
if (keyboard_check_pressed(ord("C")) && keyboard_check(vk_control)) {
    if (global.powerup_copy_disponivel) {
        global.dinheiro_copiado = global.cash_amount;
        global.powerup_copy_disponivel = false;
        global.powerup_copy_cooldown = global.powerup_copy_cooldown_total * room_speed;
        show_debug_message("💰 DINHEIRO COPIADO: " + string(global.dinheiro_copiado));
    }
}

// ============================================================================
//                          POWER-UP PASTE (Ctrl+V)
// ============================================================================
if (keyboard_check_pressed(ord("V")) && keyboard_check(vk_control)) {
    if (global.powerup_paste_disponivel) {
        if (global.dinheiro_copiado > 0) {
            global.cash_amount += global.dinheiro_copiado;
            var _valor_colado = global.dinheiro_copiado;
            global.dinheiro_copiado = 0;
            global.powerup_paste_disponivel = false;
            global.powerup_paste_cooldown = global.powerup_paste_cooldown_total * room_speed;
            show_debug_message("💵 DINHEIRO COLADO: +" + string(_valor_colado));
        } else {
            show_debug_message("⚠️ Nada copiado! Use Ctrl+C primeiro!");
        }
    }
}

// ============================================================================
//                          POWER-UP S (Câmera Lenta)
// ============================================================================
if (keyboard_check_pressed(ord("S")) && keyboard_check(vk_control)) {
    if (global.powerup_s_disponivel && !global.powerup_s_ativo) {
        global.powerup_s_ativo = true;
        global.powerup_s_timer = global.powerup_s_tempo_total * room_speed;
        global.powerup_s_disponivel = false;
        global.speed_multiplier = 0.4;
        
        // Use o nome CORRETO do seu objeto inimigo
        with (obj_Enemy) {
            path_speed = speed_current * global.speed_multiplier;
        }
        show_debug_message("POWER-UP S ATIVADO! Câmera lenta por " + string(global.powerup_s_tempo_total) + " segundos");
    }
}

// ============================================================================
//                          POWER-UP K (Mata Inimigos)
// ============================================================================
if (keyboard_check_pressed(ord("K")) && keyboard_check(vk_control)) {
    if (global.powerup_k_disponivel) {
        // Mata todos os inimigos EXCETO obj_Enemy_X
        with (obj_Enemy) {
            if (object_index != obj_Enemy_X) {
                instance_destroy();
            }
        }
        global.powerup_k_disponivel = false;
        global.powerup_k_cooldown = global.powerup_k_cooldown_total * room_speed;
        show_debug_message("POWER-UP K ATIVADO! Cooldown de " + string(global.powerup_k_cooldown_total) + " segundos");
    }
}

// ============================================================================
//                TIMERS E COOLDOWNS (rodam livremente pois não está pausado)
// ============================================================================

// Timer do Power-Up S ativo
if (global.powerup_s_ativo) {
    global.powerup_s_timer--;
    if (global.powerup_s_timer <= 0) {
        global.powerup_s_ativo = false;
        global.speed_multiplier = 1;
        
        with (obj_Enemy) {
            path_speed = speed_current;
        }
        
        global.powerup_s_cooldown = global.powerup_s_cooldown_total * room_speed;
        global.powerup_s_disponivel = false;
        show_debug_message("Power-Up S finalizado!");
    }
}

// Cooldown do Copy
if (!global.powerup_copy_disponivel) {
    global.powerup_copy_cooldown--;
    if (global.powerup_copy_cooldown <= 0) {
        global.powerup_copy_disponivel = true;
        show_debug_message("✅ Ctrl+C pronto!");
    }
}

// Cooldown do Paste
if (!global.powerup_paste_disponivel) {
    global.powerup_paste_cooldown--;
    if (global.powerup_paste_cooldown <= 0) {
        global.powerup_paste_disponivel = true;
        show_debug_message("✅ Ctrl+V pronto!");
    }
}

// Cooldown do S
if (!global.powerup_s_disponivel && !global.powerup_s_ativo) {
    global.powerup_s_cooldown--;
    if (global.powerup_s_cooldown <= 0) {
        global.powerup_s_disponivel = true;
        show_debug_message("✅ Power-Up S pronto!");
    }
}

// Cooldown do K
if (!global.powerup_k_disponivel) {
    global.powerup_k_cooldown--;
    if (global.powerup_k_cooldown <= 0) {
        global.powerup_k_disponivel = true;
        show_debug_message("✅ Power-Up K pronto!");
    }
}

// --- CANCELAR COMPRA COM ESC ---
if (keyboard_check_pressed(vk_escape)) {
    if (global.instance_tower_to_build != noone) {
        global.instance_tower_to_build = noone;
        obj_Mouse.selected_sprite = noone;
        
        with(obj_Placeable) {
            can_be_seen = false;
        }
    }
}