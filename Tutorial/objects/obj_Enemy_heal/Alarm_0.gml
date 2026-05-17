is_slowed = false;
image_blend = c_red; // Volta a ficar inteiramente vermelho

if (global.powerup_s_ativo) {
    path_speed = speed_original * global.speed_multiplier;
} else {
    path_speed = speed_original;
}