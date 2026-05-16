event_inherited();

name = "Multiplicadora";
level = 1;
upgrade_price = 150;
money_generation = 15; // Quanto dinheiro ela gera por ciclo
rate_of_fire = 180;    // Tempo do ciclo (180 frames = 3 segundos a 60fps)

radius = 0;          // Raio menor, pois ela é suporte
can_shoot = true;      // Usaremos essa variável para controlar o ciclo de grana

// Iniciar o primeiro ciclo de geração
alarm[2] = rate_of_fire;