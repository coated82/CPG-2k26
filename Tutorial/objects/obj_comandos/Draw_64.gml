// ============================================================================
//                          DESENHA MENU DE COMANDOS
// ============================================================================

var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;

// ========== TÍTULO ==========
draw_set_font(fnt_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);

draw_text(_cx, 80, "COMANDOS E PODERES");


// ========== LISTA DE COMANDOS ==========
draw_set_font(fnt_Menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _x = 80;       // Mais à esquerda
var _y = 120;      // Começa mais em cima
var _espaco = 100;  // Espaço entre linhas

for (var i = 0; i < array_length(comandos); i++) {
    var _y_pos = _y + (i * _espaco);
    
    // Tecla (preta)
    draw_set_colour(c_black);
    draw_text(_x, _y_pos, comandos[i][0]);
    
    // Descrição (cinza escuro)
    draw_set_colour(c_gray);
    draw_text(_x + 110, _y_pos, "         -> " + comandos[i][1]);
}

// ========== RODAPÉ ==========
draw_set_font(fnt_Menu);
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(_cx, display_get_gui_height() - 80, "ESC para voltar");

// ========== RESET ==========
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_set_colour(c_white);
draw_set_alpha(1);