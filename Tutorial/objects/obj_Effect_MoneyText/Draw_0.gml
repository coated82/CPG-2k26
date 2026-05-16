// Desenha o valor na tela
draw_set_color(cor_texto);
draw_set_alpha(image_alpha);

// O valor vem da variável da torre multiplicadora
draw_text(x, y, "+ R$ 15"); 

draw_set_alpha(1); // Reseta o alpha para não afetar outros desenhos