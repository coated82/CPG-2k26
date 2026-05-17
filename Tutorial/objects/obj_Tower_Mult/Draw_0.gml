// 1. Desenha o Sprite da torre
draw_self();

// 2. Desenha o alcance apenas se estiver selecionada (Variável 'selected' agora existe!)
if (selected) {
    draw_set_alpha(0.2);
    draw_circle_color(x, y, range, c_yellow, c_yellow, false);
    draw_set_alpha(1);
}

// 3. Texto do valor acima da torre
draw_set_halign(fa_center);
var _valor_atual = cash_per_pulse * level;
draw_text(x, y - 55, "+$" + string(_valor_atual));