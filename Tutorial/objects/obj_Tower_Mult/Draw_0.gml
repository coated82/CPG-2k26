// 1. Desenha o Sprite da torre
draw_self();

// 2. Desenha o alcance apenas se estiver selecionada
if (selected) {
    draw_set_alpha(0.2);
    draw_circle_color(x, y, range, c_yellow, c_yellow, false);
    draw_set_alpha(1);
}

// 3. Texto do valor acima da torre (Lógica corrigida para Level 0)
draw_set_halign(fa_center);
draw_set_color(c_white);

var _valor_para_exibir = 0;

if (level == 0) {
    // Força a exibição de 15 no nível inicial
    _valor_para_exibir = 15;
} else {
    // Segue a sua lógica original para os outros níveis
    _valor_para_exibir = cash_per_pulse * level;
}

// Desenha o texto na posição que você já usava
draw_text(x, y - 55, "+$" + string(_valor_para_exibir));