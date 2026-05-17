function tower_upgrade(_inst) {
    with(_inst) {
        // Verifica se ainda pode evoluir e se o jogador tem a grana
        if (level < max_level && global.cash_amount >= upgrade_cost) {
            
            var _paid = upgrade_cost;
            
            // 1. LÓGICA FINANCEIRA
            global.cash_amount -= _paid;
            total_invested += _paid; // Acumula para o cálculo dos 60% na venda
            
            // 2. EVOLUÇÃO BASE
            level += 1;
            range += 15; 
            fire_rate = max(20, fire_rate - 8); // Reduz o tempo entre tiros

            // 3. BÔNUS ESPECÍFICOS POR TORRE
            switch(object_index) {
                case obj_Tower_Sum:
                case obj_Tower_Sub:
                    bullet_damage += 1; 
                    damage = bullet_damage; 
                    show_debug_message("Upgrade " + name + ": Dano agora é " + string(damage));
                    break;
                
                case obj_Tower_Div:
                    extra_targets += 1;
                    slow_power = min(0.8, 0.4 + (level * 0.08));
                    show_debug_message("Upgrade Div: Alvos " + string(extra_targets) + " | Slow " + string(slow_power));
                    break;
                
                case obj_Tower_Mult:
                    // O valor gerado pela Mult geralmente é (cash_per_pulse * level)
                    // Como aumentamos o level acima, ela já gera mais automaticamente no Alarm 1
                    show_debug_message("Upgrade Mult: Gerando mais cash por pulso!");
                    break;
            }
            
            // 4. ESCALONAMENTO DE PREÇO PARA O PRÓXIMO NÍVEL
            upgrade_cost = floor(upgrade_cost * 1.8);
        } else {
            show_debug_message("Upgrade falhou: Sem dinheiro ou nivel maximo atingido.");
        }
    }
}