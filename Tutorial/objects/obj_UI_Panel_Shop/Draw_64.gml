// --- DESENHO DA TOOLTIP (VERSÃO PARA LOJA À DIREITA) ---
if (global.tooltip_text != "") {
    
    // 1. FORÇAR RESET DE CONFIGURAÇÃO (Garante que o texto apareça)
    draw_set_alpha(1);
    draw_set_font(-1); // Usa a fonte padrão do sistema para testar se o problema é a fonte
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var _w = 250; // Largura da caixa
    var _padding = 10;
    
    // 2. POSICIONAMENTO À ESQUERDA DO MOUSE
    // Como a loja está na direita, jogamos a caixa 270 pixels para a ESQUERDA do mouse
    var _gx = device_mouse_x_to_gui(0) - (_w + 20);
    var _gy = device_mouse_y_to_gui(0);

    // 3. CÁLCULO DE ALTURA
    var _h = string_height_ext(global.tooltip_text, -1, _w - (_padding * 2)) + (_padding * 2);

    // 4. DESENHO DE EMERGÊNCIA (Cores berrantes para você achar onde está)
    // Se você ver um retângulo VERMELHO, o sistema de desenho está funcionando!
    draw_set_color(c_red); 
    draw_rectangle(_gx - 2, _gy - 2, _gx + _w + 2, _gy + _h + 2, false); // Borda vermelha
    
    draw_set_color(c_black);
    draw_rectangle(_gx, _gy, _gx + _w, _gy + _h, false); // Fundo preto
    
    draw_set_color(c_white);
    draw_text_ext(_gx + _padding, _gy + _padding, global.tooltip_text, -1, _w - (_padding * 2));
    
}