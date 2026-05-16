// Ajuste do volume com as setas
if (keyboard_check(vk_right)) valor_volume += velocidade_ajuste;
if (keyboard_check(vk_left))  valor_volume -= velocidade_ajuste;

valor_volume = clamp(valor_volume, 0, 1);
audio_master_gain(valor_volume);

// Comando para voltar ao menu
if (keyboard_check_pressed(vk_escape)) {
    room_goto(rm_Menu); // Certifique-se de que este é o nome da sua sala de menu
}

