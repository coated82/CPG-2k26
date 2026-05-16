// 1. Movimento Suave (Slide)
x = lerp(x, position_current_x, 0.15);
y = lerp(y, position_current_y, 0.15);

// 2. Posicionamento Relativo dos Botões (Organização Vertical)
var _margin_x = 64; // Recuo da esquerda do painel

if (instance_exists(instance_button_close)) {
    instance_button_close.x = x + 120;
    instance_button_close.y = y + 550; // Botão de fechar lá embaixo
}

if (instance_exists(instance_tower_sub)) {
    instance_tower_sub.x = x + _margin_x - 50;
    instance_tower_sub.y = y - 200;
}

if (instance_exists(instance_tower_bomb)) {
    instance_tower_bomb.x = x + _margin_x - 50;
    instance_tower_bomb.y = y - 100;
}

if (instance_exists(instance_tower_div)) {
    instance_tower_div.x = x + _margin_x - 50;
    instance_tower_div.y = y + 0;
}

if (instance_exists(instance_tower_sum)) {
    instance_tower_sum.x = x + _margin_x - 50;
    instance_tower_sum.y = y + 100; // Somadora logo abaixo da Slow
}

if (instance_exists(instance_tower_mult)) {
    instance_tower_mult.x = x + _margin_x - 50;
    instance_tower_mult.y = y + 200;
}

// 3. Otimização: Se o painel sumiu da tela, desativa visibilidade
if (abs(x - position_hidden_x) < 1) {
    visible = false;
}