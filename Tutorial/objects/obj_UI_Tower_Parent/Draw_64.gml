// 1. Pegar posição do mouse na GUI
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// 2. Verificar se o mouse está sobre ESTA torre específica
// (Usando a mesma lógica que já funcionou no seu console)
var _hover = point_in_rectangle(_mx, _my, x - 32, y - 32, x + 32, y + 32);

if (_hover) {
    // RESET DE ESTADO (Para garantir que nada interfira no desenho)
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(-1); // Fonte padrão para não ter erro
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var _w = 220;
    var _pad = 10;
    
    // Posiciona a caixa à esquerda do mouse (já que a loja está na direita)
    var _gx = _mx - (_w + 20);
    var _gy = _my;

    // Altura dinâmica
    var _h = string_height_ext(description, -1, _w - (_pad * 2)) + (_pad * 2);

    // DESENHO DA CAIXA
    draw_set_color(c_black);
    draw_set_alpha(0.9);
    draw_rectangle(_gx, _gy, _gx + _w, _gy + _h, false); // Fundo
    
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_rectangle(_gx, _gy, _gx + _w, _gy + _h, true);  // Borda
    
    // TEXTO
    draw_text_ext(_gx + _pad, _gy + _pad, description, -1, _w - (_pad * 2));
}