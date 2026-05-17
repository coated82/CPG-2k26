// Ao apertar F11, ele inverte o estado da tela
if (keyboard_check_pressed(vk_f11)) {
    if (window_get_fullscreen()) {
        window_set_fullscreen(false);
    } else {
        window_set_fullscreen(true);
    }
}