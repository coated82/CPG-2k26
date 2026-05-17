x = lerp(x, position_current_x, 0.1);
y = lerp(y, position_current_y, 0.1);

if (instance_exists(selected_tower)) {
    tower_level = selected_tower.level;
    tower_damage = selected_tower.damage;
    tower_update_cost = selected_tower.upgrade_cost;
}

// 3. Botão Fechar (Direita)
if (instance_exists(instance_btn_close)) {
    instance_btn_close.x = bbox_right - 40; 
    instance_btn_close.y = bbox_top + 40;
}

// 4. Botão Upgrade (Ao lado do fechar)
if (instance_exists(instance_btn_purchase)) {
    instance_btn_purchase.x = bbox_right - 150;
    instance_btn_purchase.y = bbox_top + 40;
}

// 5. NOVO: Botão Vender (No Meio)
if (instance_exists(instance_btn_sell)) {
    instance_btn_sell.x = x; // Centralizado no painel
    instance_btn_sell.y = y; 
    
    // Garante que o botão está "acima" do painel na profundidade
    instance_btn_sell.depth = depth - 10; 
    
    instance_btn_sell.visible = visible;
}

if (position_current_y == position_hidden_y && abs(y - position_hidden_y) < 1) {
    visible = false;
}