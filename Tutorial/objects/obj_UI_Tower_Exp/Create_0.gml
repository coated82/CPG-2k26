// 1. Herda tudo do obj_UI_Tower_Parent (depth, lógica de clique, etc)
event_inherited();

// 2. CONFIGURAÇÃO DA TORRE (Sobrescrevendo os valores do pai)
#region TOWER INFORMATION
	name = "Exponencial";
	cost = 50;
	image = spr_Tower_Bomb; // Mantenha o nome exato do seu sprite aqui
    
    // ATENÇÃO: Verifique se o nome do objeto no seu Asset Browser 
    // é obj_Tower_Sub ou obj_Tower_Sub_Real e use o correto abaixo:
	tower_to_spawn = obj_Tower_Exp; 
    
    description = "EXPONENCIAL:\nEleva o valor do inimigo ao quadrado.\nCuidado: uso unico!";
#endregion

// 3. POSICIONAMENTO NA LOJA
offset_x = 16;
offset_y = 130;

// O 'parent' será preenchido automaticamente pelo obj_UI_Shop ao te criar