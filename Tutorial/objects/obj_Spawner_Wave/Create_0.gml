global.wave = 0; 
enemies_to_spawn = 0; 
spawn_delay = 60;      
timer_next_wave = 180; 

// Controle de fluxo
is_spawning = false;   
spawn_finished = false; // Adicionado para compatibilidade com sua lógica
total_in_wave = 0;     

// Inicia o timer para a primeira wave
alarm[0] = timer_next_wave;