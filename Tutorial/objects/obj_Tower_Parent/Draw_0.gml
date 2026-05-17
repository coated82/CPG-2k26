// ============================================================================
//                         DRAW - OBJ_TOWER_PARENT
// ============================================================================

// 1. Lógica de seleção (O "Display" do Range)
// Substituímos is_selected por global.selected_tower == id para maior precisão
if (global.selected_tower == id) {
    
    // Fundo Preto Transparente
    draw_set_alpha(0.2);
    // Corrigido: radius -> range
    draw_circle_color(x, y, range, c_black, c_black, false);
    
    // Borda Verde Limão (Dá um contraste melhor no mapa)
    draw_set_alpha(1);
    // Corrigido: radius -> range
    draw_circle_color(x, y, range, c_lime, c_lime, true);
}

// 2. Desenha o sprite da própria torre (Desenha por cima do range)
draw_self();

// Reset do Alpha para não afetar outros objetos
draw_set_alpha(1);