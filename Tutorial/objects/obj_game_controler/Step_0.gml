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