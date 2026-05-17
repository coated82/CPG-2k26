function tower_upgrade(_inst) {
    with(_inst) {
        if (level < max_level && global.cash_amount >= upgrade_cost) {
            
            global.cash_amount -= upgrade_cost;
            level += 1;
            
            // Melhora comum: Alcance e Velocidade (Gera dinheiro mais rápido)
            range += 15; 
            fire_rate = max(60, fire_rate - 15); // Nunca menos que 1 segundo (60 frames)

            switch(object_index) {
                case obj_Tower_Sum:
                case obj_Tower_Sub:
                    bullet_damage += 1; 
                    damage = bullet_damage; 
                    show_debug_message("Upgrade na " + name + "! Novo Dano: " + string(bullet_damage));
                    break;
                
                case obj_Tower_Div:
                    extra_targets += 1;
                    slow_power = min(0.8, 0.4 + (level * 0.08));
                    show_debug_message("Upgrade na Divisora! Slow: " + string(slow_power));
                    break;

                case obj_Tower_Mult:
                    // Aumentamos o multiplicador base no upgrade
                    // Assim o ganho no Alarme 1 sobe automaticamente
                    show_debug_message("Upgrade na Multiplicadora! Nivel: " + string(level));
                    break;
            }
            
            upgrade_cost = floor(upgrade_cost * 1.8);
        }
    }
}