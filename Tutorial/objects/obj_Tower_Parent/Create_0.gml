// ============================================================================
//                         CREATE - OBJ_TOWER_PARENT
// ============================================================================

#region INFORMAÇÕES BÁSICAS (Definidas pelos Filhos)
    name = "Parent Tower";
    cost = 0;
    image = noone;
    tower_to_spawn = noone;
#endregion

#region SISTEMA DE UPGRADES E STATUS
    level = 0;           // Nível atual (0 a 5)
    max_level = 5;       // Limite de upgrades
    
    // Status Base (Serão modificados pelo Script de Upgrade)
    range = 160;         // Alcance do tiro
    fire_rate = 60;      // Tempo entre disparos (em frames)
    damage = 1;          // Dano base (Soma/Sub)
    
    // Status Específicos
    extra_targets = 1;   // Alvos extras (Exclusivo Divisora)
    slow_power = 0.4;    // Força do Slow (Exclusivo Divisora)
    money_bonus = 0;     // Bônus de Cash (Exclusivo Multiplicadora)
    
    // Cálculo inicial do custo de Upgrade (50% a mais que o custo da torre)
    // Usamos 'cost' que será definido no Create do objeto filho
    upgrade_cost = floor(cost * 1.5); 
#endregion

#region VARIÁVEIS DE CONTROLE INTERNO
    shooting_timer = 0;  // Contador para o intervalo de tiro
    target = noone;      // Referência ao inimigo atual
    
    // Controle de Seleção (Para abrir o menu de upgrade)
    is_selected = false; 
#endregion

depth = -10; // Profundidade padrão das torres no mapa