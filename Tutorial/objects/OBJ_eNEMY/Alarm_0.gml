// Limpa o estado de lentidão
is_slowed = false;
image_blend = c_white; // Volta à cor original

// Recalcula a velocidade correta (considerando se tem power-up ativo ou não)
if (global.powerup_s_ativo) {
    path_speed = speed_original * global.speed_multiplier;
} else {
    path_speed = speed_original;
}