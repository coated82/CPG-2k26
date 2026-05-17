// ============================================================================
//                             SISTEMA DE PAUSA
// ============================================================================
if (keyboard_check_pressed(ord("P")) && keyboard_check(vk_control)) {
    global.pausado = !global.pausado;
    if (global.pausado) {
        show_debug_message("Jogo Pausado");
    } else {
        show_debug_message("Jogo Retomado");
    }
}

if (global.pausado) {
    if (keyboard_check_pressed(vk_escape)) {
        global.pausado = false;
        room_goto(rm_Menu);
    }
    exit;  // <-- SAI AQUI SE PAUSADO, ENTÃO NÃO EXECUTA O RESTO
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
        with (obj_Enemy) {  // <-- VERIFIQUE ESTE NOME!
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
        // Use o nome CORRETO do seu objeto inimigo
        with (obj_Enemy) {  // <-- VERIFIQUE ESTE NOME!
            instance_destroy();
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
        
        // Use o nome CORRETO do seu objeto inimigo
        with (obj_Enemy) {  // <-- VERIFIQUE ESTE NOME!
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