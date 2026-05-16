if (is_selected == true) {
    // 1. Desenha a área preenchida (Sombra interna)
    draw_set_alpha(0.2); // Bem clarinho
    draw_set_color(c_black);
    draw_circle(x, y, radius, false); // FALSE para ser preenchido
    
    // 2. Desenha o contorno principal (Verde)
    draw_set_alpha(1); // Opacidade total para a borda
    draw_set_color(c_lime);
    draw_circle(x, y, radius, true); // TRUE para ser apenas a linha
    
    // 3. Resetar para não bugar o resto do jogo
    draw_set_color(c_white);
}

// Desenha a torre por cima de tudo
draw_self();