event_inherited(); 

image_xscale = 0.15;
image_yscale = 0.15;

// Nomes padronizados para o Script de Upgrade e Painel
name = "Somadora";
level = 0;
max_level = 5; 
bullet_damage = 2; 
upgrade_cost = 100; // Mudei de upgrade_price para upgrade_cost (padrão que usamos)

// Dados de funcionamento
range = 200;        // Mudei de radius para range
fire_rate = 45;     // Mudei para frames (45 frames = 0.75s em 60fps)
can_shoot = true;

target = noone;

description = "Adiciona valor a números negativos.";