if (global.pausado) exit;

// ========== TÍTULO ANIMADO ==========
var _gx = display_get_gui_width() / 2;  // Centraliza na tela
var _gy = 120;

tempo_menu += 1;
var _escala = 2 + (dsin(tempo_menu * 0.5) * 0.05);
var _angulo = dsin(tempo_menu) * 5;

draw_set_font(fnt_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);
draw_text_transformed(_gx, _gy, "CONTROL + PAPER", _escala, _escala, _angulo);

// ========== MENU DE OPÇÕES ==========
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(menu); i++) {
    // Cor da opção
    if (i == atual) {
        draw_set_colour(c_red);
        var _margem_atual = margem;
    } else {
        draw_set_colour(c_black);
        var _margem_atual = 0;
    }
    
    // Sombra (opcional, dá um charme a mais)
    if (i == atual) {
        draw_set_colour(c_gray);
        draw_text(menu_x + _margem_atual + 2, menu_y_base + (altura_linha * i) + 5 + 50 * i, menu[i].texto);
        draw_set_colour(c_red);
    }
    
    // Texto principal
    draw_text(menu_x + _margem_atual, menu_y_base + (altura_linha * i) + (50 * i), menu[i].texto);
}

// ========== RESET DAS CORES ==========
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);