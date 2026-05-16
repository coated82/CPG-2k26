// ============================================================================
//                          VOLTAR AO MENU
// ============================================================================

// Qualquer tecla volta? Só ESC
if (keyboard_check_pressed(vk_escape)) {
    room_goto(rm_Menu);
}

// Animação
tempo_anim++;