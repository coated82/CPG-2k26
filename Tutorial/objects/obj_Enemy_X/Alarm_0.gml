// 1. Limpa o estado de lentidão
is_slowed = false;

// 2. Feedback Visual
// Em vez de branco puro, podemos deixar ele com a cor original (cinza/escuro)
image_blend = make_color_rgb(200, 200, 200); 

// 3. Recalcula a velocidade de "Boss"
// Importante: Aqui ele usa o speed_original que é 0.4
if (global.powerup_s_ativo) {
    path_speed = speed_original * global.speed_multiplier;
} else {
    path_speed = speed_original;
}

show_debug_message("Boss X recuperou sua velocidade normal (lenta).");