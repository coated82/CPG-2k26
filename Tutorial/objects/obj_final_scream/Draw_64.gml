// ============================================================================
//                          DESENHA TELA DE GAME OVER
// ============================================================================

var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;

// Fundo escuro
draw_set_colour(c_black);
draw_set_alpha(0.95);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// ===== TÍTULO "VOCÊ PERDEU" em vermelho e caixa alta =====
draw_set_font(fnt_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_red);

var _escala = 1.5 + (dsin(tempo_anim * 0.05) * 0.05);
draw_text_transformed(_cx, 100, "VOCÊ PERDEU", _escala, _escala, 0);

// ===== INFORMAÇÕES =====
draw_set_font(fnt_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_colour(c_white);

var _y = 200;

// Wave que chegou
draw_text(_cx, _y, "Wave: " + string(global.wave));
_y += 50;

// Recorde da fase
var _recorde = 0;
switch (global.fase_atual) {
    case "Paralelo":
        _recorde = global.recorde_paralelo;
        break;
    case "Quadratico":
        _recorde = global.recorde_quadratico;
        break;
    case "Euler":
        _recorde = global.recorde_euler;
        break;
}
draw_text(_cx, _y, "Recorde: Wave " + string(_recorde));
_y += 50;

// Dinheiro gasto
draw_text(_cx, _y, "Dinheiro gasto: $" + string(global.dinheiro_gasto));
_y += 50;

// Dinheiro ganho
draw_text(_cx, _y, "Dinheiro ganho: $" + string(global.gain_cash));
_y += 50;

// Lucro/Prejuízo
var _saldo = global.gain_cash - global.dinheiro_gasto;
if (_saldo >= 0) {
    draw_set_colour(c_lime);
    draw_text(_cx, _y, "Lucro: +$" + string(_saldo));
} else {
    draw_set_colour(c_red);
    draw_text(_cx, _y, "Prejuízo: -$" + string(abs(_saldo)));
}

// ===== INSTRUÇÃO =====
draw_set_font(-1);
draw_set_colour(c_gray);
draw_set_alpha(0.7);
draw_set_valign(fa_bottom);
draw_text(_cx, display_get_gui_height() - 50, "Clique ou pressione qualquer tecla para voltar ao menu");

// ===== RESET =====
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_set_colour(c_white);
draw_set_alpha(1);