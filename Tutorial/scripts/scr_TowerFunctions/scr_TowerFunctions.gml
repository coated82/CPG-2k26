function tower_upgrade(_inst) {
    with(_inst) {
        // Verifica se tem dinheiro e se não atingiu o nível máximo
        if (level < max_level && global.cash_amount >= upgrade_cost) {
            
            // 1. Cobra o valor ATUAL antes de escalonar o preço
            global.cash_amount -= upgrade_cost;
            
            // 2. Sobe o nível
            level += 1;
            
            // 3. Melhora os atributos base (comum a todas)
            range += 15; 
            fire_rate = max(20, fire_rate - 8); 

            // 4. Bônus específicos por tipo de torre
            switch(object_index) {
                // As duas torres aritméticas agora ganham dano juntas
                case obj_Tower_Sum:
                case obj_Tower_Sub:
                    bullet_damage += 1; 
                    damage = bullet_damage; 
                    break;
                
                case obj_Tower_Div:
                    extra_targets += 1;
                    // Aumenta o poder de lentidão até um limite de 80% (0.8)
                    slow_power = min(0.8, 0.4 + (level * 0.08));
                    break;
            }
            
            // 5. Escala o custo para o PRÓXIMO upgrade
            upgrade_cost = floor(upgrade_cost * 1.8);
            
            show_debug_message("Upgrade realizado na " + name + "! Novo Dano: " + string(bullet_damage));
        }
    }
}