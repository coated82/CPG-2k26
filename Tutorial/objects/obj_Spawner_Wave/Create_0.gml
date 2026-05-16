global.wave = 0; 
enemies_to_spawn = 0; // Quantos faltam nascer na wave atual
spawn_delay = 30;     // Intervalo entre um inimigo e outro (em frames)
timer_next_wave = 180; 

alarm[0] = timer_next_wave; // Alarme para INICIAR a wave