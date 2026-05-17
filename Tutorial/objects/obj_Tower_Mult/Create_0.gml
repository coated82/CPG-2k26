event_inherited(); // Puxa variáveis do obj_Tower_Parent

image_xscale = 0.15;
image_yscale = 0.15;

name = "Multiplicadora";
level = 1;
upgrade_price = 150;

// Configuração de Lucro
cash_per_pulse = 15; 
rate_of_fire = 120; // 2 segundos (se o jogo for 60fps)

// START: Liga o primeiro ciclo de geração
alarm[1] = rate_of_fire;