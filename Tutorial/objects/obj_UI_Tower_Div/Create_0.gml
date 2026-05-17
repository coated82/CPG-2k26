// 1. Herda tudo do obj_UI_Tower_Parent (depth, lógica de clique, etc)
event_inherited();

// 2. CONFIGURAÇÃO DA TORRE (Sobrescrevendo os valores do pai)
#region TOWER INFORMATION
	name = "Divisora";
	cost = 110;
	image = spr_Tower_Slow; // Mantenha o nome exato do seu sprite aqui
    
    // ATENÇÃO: Verifique se o nome do objeto no seu Asset Browser 
    // é obj_Tower_Sub ou obj_Tower_Sub_Real e use o correto abaixo:
	tower_to_spawn = obj_Tower_Div; 
    
    description = "DIVISORA:\nDivide a velocidade do inimigo.\nÓtima para enfraquecer hordas!";
#endregion

// 3. POSICIONAMENTO NA LOJA
offset_x = 16;
offset_y = 258;