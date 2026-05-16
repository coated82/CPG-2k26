// Desenhando todos os itens do Menu
for (var i = 0; i < array_length(menu); i++)
{
	var _cor =  c_white;
	// Definindo a fonte do Menu
	draw_set_font(fnt_Menu);
	
	// Pegando a autura do meu texto
	var _altura = string_height("I") * 1.5;
	
	var _margem = 0;
	
	// Checando se a opção atual está selecionada
	if(i == atual)
	{
		_cor = c_red;
		_margem = margem;
	}
	
	draw_set_colour(_cor);
	draw_text(40 + _margem, 20 + _altura * i, menu[i].texto);
	draw_set_colour(-1);
	draw_set_font(-1);
}