/// @description 

// global variables
global.cash_amount = 100;
global.wave = 0;
global.instance_tower_to_build = noone;
global.hitpoints = 10;

room_goto(rm_Menu);

// Definimos a string com a ordem exata dos caracteres que estão nos frames da sprite
var ordem_dos_caracteres = "0123456789";

// Criamos a fonte a partir da sprite.
// O terceiro argumento (prop) define se a fonte é proporcional (true) ou largura fixa (false).
// O quarto argumento é o espaçamento em pixels entre cada número.
global.fonte_handdrawn = font_add_sprite_ext(spr_fonte_numeros, ordem_dos_caracteres, true, 2);

/* --- Pra colocar no objeto ná hora de fazer funcionar ---

// 1. Dizemos ao GameMaker para usar a nossa fonte customizada
draw_set_font(global.fonte_handdrawn);

// 2. Opcional: Define a cor (se o seu desenho original for branco, você pode colori-lo aqui!)
draw_set_color(c_white);

// 3. Digita o texto normalmente. O GameMaker vai traduzir o texto para os frames da sprite!
var pontuacao = 15392;
draw_text(50, 50, "PONTOS: " + string(pontuacao));

*/
