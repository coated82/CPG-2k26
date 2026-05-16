// 1. LIMPEZA E CONFIGURAÇÃO INICIAL
// Centralizamos tudo no meio da tela (Room)
var _meio_x = room_width / 2;
var _meio_y = room_height / 2;

draw_set_font(fnt_Menu);
draw_set_colour(c_white);

// --- TÍTULO DO VOLUME ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_meio_x, _meio_y - 80, "VOLUME: " + string(round(valor_volume * 100)) + "%");


// --- BARRA E BOTÃO ---
// Desenha a barra centralizada
var _escala_barra = largura_customizada / sprite_get_width(spr_slider_barra);
draw_sprite_ext(spr_slider_barra, 0, _meio_x, _meio_y, _escala_barra, 1, 0, c_white, 1);

// Calcula a posição do botão (usando o centro como referência)
var _inicio_x = _meio_x - (largura_customizada / 2);
var _fim_x = _meio_x + (largura_customizada / 2);
var _botao_x = lerp(_inicio_x, _fim_x, valor_volume);

draw_sprite(spr_slider_botao, 0, _botao_x, _meio_y);


// --- TEXTO DE BAIXO (O que estava cortando) ---
// Vamos forçar o alinhamento central e uma escala menor para não vazar da tela
draw_set_halign(fa_center);
draw_set_valign(fa_bottom); // Alinha pela base do texto

var _texto_instrucao = "Pressione ESC para voltar ao menu";
var _escala_pequena = 0.6; // Diminuindo para 60% do tamanho pra caber com folga

draw_text_transformed(_meio_x, room_height - 30, _texto_instrucao, _escala_pequena, _escala_pequena, 0);


// 2. RESET FINAL
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(-1);