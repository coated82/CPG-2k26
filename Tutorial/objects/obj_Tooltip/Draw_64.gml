if (text != "") {
    var _padding = 10;
    var _draw_x = device_mouse_x_to_gui(0) + 15;
    var _draw_y = device_mouse_y_to_gui(0) + 15;

    // Ajustar altura baseada no texto (opcional)
    draw_set_font(fnt_Small); // Certifique-se de ter uma fonte pequena
    height = string_height_ext(text, -1, width) + (_padding * 2);

    // 1. Desenhar a sombra/fundo
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(_draw_x, _draw_y, _draw_x + width, _draw_y + height, false);
    
    // 2. Desenhar a borda
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_rectangle(_draw_x, _draw_y, _draw_x + width, _draw_y + height, true);

    // 3. Desenhar o texto
    draw_text_ext(_draw_x + _padding, _draw_y + _padding, text, -1, width - _padding);
}