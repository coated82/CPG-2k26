// ============================================================================
//                          VOLTAR AO MENU
// ============================================================================

tempo_anim++;

// Qualquer tecla ou clique volta ao menu
if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left)) {
    room_goto(rm_Menu);
}