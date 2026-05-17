// ============================================================================
//                         CREATE - OBJ_TOWER_PARENT
// ============================================================================

#region INFORMAÇÕES BÁSICAS
    name = "Parent Tower";
    cost = 0;
    image = noone;
    tower_to_spawn = noone;
    
    // --- CONTROLE VISUAL ---
    image_speed = 0; // Impede animação automática
    image_index = 0; // Começa no frame 0 (Nível 1)
#endregion

#region SISTEMA DE UPGRADES E STATUS
    level = 1;           
    max_level = 6;       
    
    range = 160;         
    fire_rate = 60;      
    damage = 1;          
    
    extra_targets = 1;   
    slow_power = 0.4;    
    money_bonus = 0;     
    
    upgrade_cost = 150; 
#endregion

#region VARIÁVEIS DE CONTROLE INTERNO
    shooting_timer = 0;  
    target = noone;      
    is_selected = false; 
    
    total_invested = 0;  
    my_slot_x = x;       
    my_slot_y = y;
#endregion

depth = -y;