// Estruturas do Menu
opcao1 =
{
	texto : "Jogar",
	
	funcao : function()
	{
		room_goto(rm_MainGame);
	},
}
opcao2 =
{
	texto : "Opções",
	
	funcao : function()
	{
		show_message("Arruma isso pra jogar pra uma tela de opções de volume sla se vira programador")
	},
}
opcao3 =
{
	texto : "Comandos",
	
	funcao : function()
	{
		show_message("Joga essa porra pra tela de Comandos Porra")
	},
}
opcao4 =
{
	texto : "Sair",
	
	funcao : function()
	{
		game_end();
	},
}


// Menu
menu = [opcao1, opcao2, opcao3, opcao4];

// Variável para saber qual o indice atual
atual = 0;

// Margem do Menu
margem = 0;