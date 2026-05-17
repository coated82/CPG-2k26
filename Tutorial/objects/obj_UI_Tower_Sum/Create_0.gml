// 1. Puxa as definições base do Pai
event_inherited();

// 2. Define os dados ESPECÍFICOS desta torre
#region TOWER INFORMATION
    name = "Somadora";
    cost = 100;
    image = spr_Tower_Sum; // Use o nome do seu sprite de soma
    tower_to_spawn = obj_Tower_Sum; 
    
    // É esta linha que o Draw GUI do pai vai ler!
    description = "SOMADORA:\nAdiciona valores aos inimigos. Otima para neutralizar numeros negativos!";
#endregion

// 3. Posição na loja (ajuste conforme necessário)
offset_x = 16;
offset_y = 160;