// ========== LIMPA TUDO ANTES DE COMEÇAR ==========
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);

// ========== VARIÁVEIS ==========
var _gx = display_get_gui_width() / 2;
var _gy = display_get_gui_height() / 2;

// ========== TEXTO DO VOLUME ==========
draw_set_font(fnt_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);
draw_text(_gx, _gy - 80, "VOLUME: " + string(round(valor_volume * 100)) + "%");

// ========== BARRA ==========
var _escala_barra = largura_customizada / sprite_get_width(spr_slider_barra);
draw_sprite_ext(spr_slider_barra, 0, _gx, _gy, _escala_barra, 1, 0, c_black, 1);

// ========== BOTÃO ==========
var _inicio_x = _gx - (largura_customizada / 2);
var _botao_x = _inicio_x + (valor_volume * largura_customizada);
draw_sprite(spr_slider_botao, 0, _botao_x, _gy);

// ========== TEXTO ESC ==========
draw_set_font(fnt_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_colour(c_black);
draw_text(_gx, display_get_gui_height() - 20, "Pressione ESC para voltar ao menu");

// ========== RESET FINAL (SALVA-VIDAS) ==========
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);