event_inherited(); 

// Dados de Identidade
name = "Multiplicadora";
level = 0;
max_level = 5;
upgrade_cost = 150;

// Variáveis de Economia (Corrigindo os erros de crash)
cash_per_pulse = 15;   
fire_rate = 300;       
selected = false;      // <--- ISSO resolve o erro do seu último crash
range = 100;

// Inicialização
alarm[1] = fire_rate; 

// Estética
image_xscale = 0.15;
image_yscale = 0.15;