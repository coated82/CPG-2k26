event_inherited(); 

// --- APARÊNCIA ---
image_xscale = 0.15;
image_yscale = 0.15;
image_speed = 0;
image_index = 0; // Começa no frame 0 (Nível 0)

// --- IDENTIFICAÇÃO E EVOLUÇÃO ---
name = "Somadora";
level = 0;
max_level = 5; 
upgrade_cost = 100;

// --- ATRIBUTOS DE COMBATE ---
damage = 2;         // Dano que será incrementado pelo Script
bullet_damage = 2;  // Variável de backup (sincronizada com damage no Step)
range = 200;        
fire_rate = 45;     
can_shoot = true;

target = noone;
description = "Adiciona valor a números negativos.";