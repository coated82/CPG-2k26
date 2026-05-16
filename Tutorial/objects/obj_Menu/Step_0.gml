// Mudando de Opção

// Descendo pelo Menu
if(keyboard_check_pressed(vk_down)) 
{
	atual++;
	margem = 0;
}
// Subindo pelo Menu
if(keyboard_check_pressed(vk_up))
{
	atual--;
	margem = 0;
}
// Limitando a variavel atual
atual = clamp(atual, 0, array_length(menu) - 1);

// Se eu apertei enter, executar opção
if (keyboard_check_pressed(vk_enter))
{
	menu[atual].funcao();
}

// Fazendo o valor da margem almentar
margem = lerp(margem, 60, .1);