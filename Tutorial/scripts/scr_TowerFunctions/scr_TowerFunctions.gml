function tower_upgrade(_inst) {
    with(_inst) {
        // Verifica se ainda pode evoluir e se o jogador tem o dinheiro
        if (level < max_level && global.cash_amount >= upgrade_cost) {
            
            // 1. LÓGICA FINANCEIRA
            global.cash_amount -= upgrade_cost;
            total_invested += upgrade_cost;
            
            // 2. EVOLUÇÃO
            level += 1;
            
            // Sincronia: Level 1 mostra Frame 1, Level 2 mostra Frame 2...
            image_index = level; 

            // 3. STATUS GERAIS
            range += 15; 
            fire_rate = max(20, fire_rate - 8); 

            // 4. BÔNUS ESPECÍFICOS POR TIPO
            switch(object_index) {
                case obj_Tower_Sum:
                case obj_Tower_Sub:
                    // Aumenta o dano que a bala vai carregar
                    if (variable_instance_exists(id, "bullet_damage")) {
                        bullet_damage += 1;
                        damage = bullet_damage;
                    } else {
                        damage += 1;
                    }
                    break;
                    
                case obj_Tower_Div:
                    extra_targets += 1;
                    slow_power = min(0.8, 0.4 + (level * 0.08));
                    break;
                
                case obj_Tower_Mult:
                    // Aumenta a geração de dinheiro da Multiplicadora
                    if (variable_instance_exists(id, "cash_per_pulse")) {
                        cash_per_pulse += 15; 
                    }
                    // Opcional: faz ela pulsar mais rápido a cada nível
                    fire_rate = max(120, fire_rate - 20); 
                    break;
            }
            
            // 5. ESCALONAMENTO DE PREÇO
            upgrade_cost = floor(upgrade_cost * 1.8);
            
            show_debug_message("Upgrade: " + name + " para Level " + string(level));

        } else {
            show_debug_message("Não foi possível realizar o upgrade.");
        }
    }
}