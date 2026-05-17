if (global.pausado) {
    alarm[0] = 1; 
    exit;
}

// 1. Incrementar a Wave
global.wave += 1;

// 2. Quantidade de inimigos (Crescimento linear)
enemies_to_spawn = 5 + floor(global.wave * 1.5);

// 3. NOVO ESPAÇAMENTO
// Começa com 60 frames e diminui suavemente
spawn_delay = max(20, 60 - (global.wave * 1)); 

// 4. DISPARA O SPAWN
is_spawning = true; 
spawn_finished = false;
alarm[1] = 1; 

show_debug_message("Preparando Wave " + string(global.wave) + " | Inimigos: " + string(enemies_to_spawn));