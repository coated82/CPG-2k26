function tower_upgrade(_inst) {
    with(_inst) {
        if (level < max_level && global.cash_amount >= upgrade_cost) {
            
            // 1. LÓGICA FINANCEIRA
            global.cash_amount -= upgrade_cost;
            total_invested += upgrade_cost;
            
            // 2. EVOLUÇÃO
            level += 1;
            
            // --- AJUSTE DE FRAME ---
            // Se o nível 1 é o frame 1, o nível 2 tem que ser o frame 2
            image_index = level; 

            // 3. STATUS (Seu código atual...)
            range += 15; 
            fire_rate = max(20, fire_rate - 8); 

            // 4. BÔNUS POR TIPO (Switch...)
            switch(object_index) {
                case obj_Tower_Sum:
                case obj_Tower_Sub:
                    bullet_damage += 1; 
                    damage = bullet_damage; 
                    break;
                case obj_Tower_Div:
                    extra_targets += 1;
                    slow_power = min(0.8, 0.4 + (level * 0.08));
                    break;
            }
            
            upgrade_cost = floor(upgrade_cost * 1.8);
        }
    }
}