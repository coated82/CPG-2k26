// 1. Configurações de Alinhamento para o Título
draw_set_font(fnt_Menu);
draw_set_halign(fa_center); // Centraliza horizontalmente o eixo
draw_set_valign(fa_middle); // Centraliza verticalmente o eixo

// Incrementa o tempo
tempo_menu += 1; 

// Efeitos
var _escala = 2 + (dsin(tempo_menu * 0.5) * 0.05);
var _angulo = dsin(tempo_menu) * 5;

// IMPORTANTE: Como alinhamos ao centro, o X deve ser a posição do MEIO do texto.
// Se antes era 20 (no canto), agora talvez você queira algo como 150 ou o centro da tela.
var _posX = 250; 
var _posY = 80;

draw_set_colour(c_white);
draw_text_transformed(_posX, _posY, "Control + Paper", _escala, _escala, _angulo);

// 2. RESETAR ALINHAMENTO para não quebrar o resto do menu
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(-1);

// 3. Loop do Menu (segue normal)
for (var i = 0; i < array_length(menu); i++)
{
    var _cor = c_white;
    draw_set_font(fnt_Menu);
    
    var _altura = string_height("I") * 1.5;
    var _margem = 0;
    
    if(i == atual)
    {
        _cor = c_red;
        _margem = margem;
    }
    
    draw_set_colour(_cor);
    // Note que o menu continua usando 40 porque resetamos o fa_left acima
    draw_text(40 + _margem, 180 + _altura * i, menu[i].texto);
    
    draw_set_colour(-1);
    draw_set_font(-1);
}