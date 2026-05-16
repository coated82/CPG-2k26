// Desenha o range se selecionado
if (is_selected) {
    draw_set_alpha(0.2);
    draw_circle_color(x, y, radius, c_black, c_black, false);
    draw_set_alpha(1);
    draw_circle_color(x, y, radius, c_lime, c_lime, true);
}

draw_self();