event_inherited(); 

// Dados de Identidade
name = "Multiplicadora";
level = 0;
max_level = 5;
upgrade_cost = 150;

// Variáveis de Economia (Ajustadas para 15 inicial)
cash_per_pulse = 15;   // Geração inicial definida para 15
fire_rate = 300;       
selected = false;      
range = 100;

// Inicialização
image_speed = 0;
image_index = 0;       // Garante que começa no frame do Level 0
alarm[1] = fire_rate;  // Inicia o ciclo de geração

// Estética
image_xscale = 0.15;
image_yscale = 0.15;