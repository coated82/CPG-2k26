// ============================================================================
//                          CREATE - OBJ_TOWER_PARENT
// ============================================================================

#region INFORMAÇÕES BÁSICAS
    name = "Parent Tower";
    cost = 0;
    image = noone;
    tower_to_spawn = noone;
#endregion

#region SISTEMA DE UPGRADES E STATUS
    level = 1;           // Começa no Nível 1
    max_level = 5;       
    
    range = 160;         
    fire_rate = 60;      
    damage = 1;          
    
    extra_targets = 1;   
    slow_power = 0.4;    
    money_bonus = 0;     
    
    upgrade_cost = 150; // Valor base padrão
#endregion

#region VARIÁVEIS DE CONTROLE INTERNO
    shooting_timer = 0;  
    target = noone;      
    is_selected = false; 
    
    // Rastreamento de Investimento e Posição
    total_invested = 0;  // Será definido no momento da compra
    my_slot_x = x;       // Salva posição inicial
    my_slot_y = y;       // Salva posição inicial
#endregion

depth = -y; // Profundidade dinâmica baseada na posição Y (melhor que -10 fixo)