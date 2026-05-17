// Herda as variáveis básicas do obj_Tower_Parent (total_invested, my_slot_x, etc.)
event_inherited(); 

// --- INFORMAÇÕES BÁSICAS ---
name = "Bomba Exponencial";
level = 1;
max_level = 1;      // Bombas geralmente não tem upgrade
upgrade_cost = 0;   // Nome corrigido de upgrade_price para upgrade_cost
cost = 50;          // Custo de compra

// --- STATUS DE COMBATE ---
// O Painel busca "damage", então definimos aqui o dano da explosão
damage = 10; 
bullet_damage = damage; 

// --- LÓGICA DA BOMBA ---
radius = 200; 
detonation_time = 0.5 * game_get_speed(gamespeed_fps); 

// Inicia a contagem para explodir
alarm[0] = detonation_time;

// Escala padrão (2x2 no cenário, mas a sprite é pequena)
image_xscale = 0.15;
image_yscale = 0.15;

show_debug_message("Bomba Exponencial plantada!");