is_slowed = false;

if (global.powerup_s_ativo) {
    path_speed = speed_original * global.speed_multiplier;
} else {
    path_speed = speed_original;
}