// 1. O Painel se move
x = lerp(x, position_current_x, 0.1);
y = lerp(y, position_current_y, 0.1);

// 2. O Painel carrega o X de fechar
if (instance_exists(instance_btn_close)) {
    instance_btn_close.x = bbox_right - 40; 
    instance_btn_close.y = bbox_top + 40;
}

// 3. O Painel carrega a Seta de upgrade
if (instance_exists(instance_btn_purchase)) {
    instance_btn_purchase.x = bbox_right - 100;
    instance_btn_purchase.y = bbox_top + 40;
}

// 4. Se estiver quase no lugar (escondido), desativa visibilidade
if (position_current_y == position_hidden_y && abs(y - position_hidden_y) < 1) {
    visible = false;
}