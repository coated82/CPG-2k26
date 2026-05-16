// 1. Lógica de seleção (O "Display" do Range)
// Substituímos is_selected por global.selected_tower == id
if (global.selected_tower == id) {
    // Fundo Preto Transparente
    draw_set_alpha(0.2);
    draw_circle_color(x, y, radius, c_black, c_black, false);
    
    // Borda Verde Limão
    draw_set_alpha(1);
    draw_circle_color(x, y, radius, c_lime, c_lime, true);
}

// 2. Desenha o sprite da própria torre
draw_self();