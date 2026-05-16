// 1. Move o painel suavemente
x = lerp(x, position_current_x, 0.1);
y = lerp(y, position_current_y, 0.1);

// 2. Posiciona o botão de FECHAR (X) - Bem no canto direito
if (instance_exists(instance_btn_close)) {
    instance_btn_close.x = bbox_right - 40; 
    instance_btn_close.y = bbox_top + 40;
}

// 3. Posiciona a SETA (Upgrade) - Ao lado do botão de fechar
if (instance_exists(instance_btn_purchase)) {
    // Mesma altura (y) do botão de fechar, mas 60 pixels mais para a esquerda (x)
    instance_btn_purchase.x = bbox_right - 100; // Aumentamos o recuo no X
    instance_btn_purchase.y = bbox_top + 40;    // Mesma altura do botão X
}

// 4. Controle de visibilidade
if (position_current_y == position_hidden_y && abs(y - position_hidden_y) < 1) {
    visible = false;
}