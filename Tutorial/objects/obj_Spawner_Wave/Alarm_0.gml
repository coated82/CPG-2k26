if (global.pausado) {
    alarm[0] = 1; // Espera o pause acabar
    exit;
}

global.wave += 1;

// BALANCEAMENTO ESTILO BLOONS:
// 1. Quantidade cresce linearmente
enemies_to_spawn = 5 + floor(global.wave * 1.5);

// 2. O intervalo entre inimigos diminui (fica mais frenético)
spawn_delay = max(10, 40 - (global.wave * 2)); 

// 3. Dispara o Alarme 1 para começar a soltar os inimigos um por um
alarm[1] = 1; 

show_debug_message("Preparando Wave " + string(global.wave));