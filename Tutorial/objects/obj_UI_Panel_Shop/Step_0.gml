// Movimento Suave do Painel
x = lerp(x, position_current_x, 0.1);
y = lerp(y, position_current_y, 0.1);

// Atualizar posição e visibilidade dos filhos
if (instance_exists(instance_button_close)) {
    instance_button_close.x = x;
    instance_button_close.y = y + 220; // Ajuste para o rodapé do menu
    instance_button_close.visible = visible;
}

if (instance_exists(instance_tower_machinegun)) {
    instance_tower_machinegun.x = x;
    instance_tower_machinegun.y = y - 100; // Torre superior
    instance_tower_machinegun.visible = visible;
}

if (instance_exists(instance_tower_bomb)) {
    instance_tower_bomb.x = x;
    instance_tower_bomb.y = y;       // Torre central
    instance_tower_bomb.visible = visible;
}

if (instance_exists(instance_tower_slow)) {
    instance_tower_slow.x = x;
    instance_tower_slow.y = y + 100; // Torre inferior
    instance_tower_slow.visible = visible;
}