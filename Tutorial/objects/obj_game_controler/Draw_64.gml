// ========== DESENHA MENU DE PAUSA GLOBAL ==========
if (global.pausado) {
    // Fundo escuro
    draw_set_colour(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
    // Texto centralizado
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_Menu);
    draw_set_colour(c_white);
    
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    draw_text(_cx, _cy - 50, "JOGO PAUSADO");
    draw_set_font(-1);
    draw_text(_cx, _cy, "Ctrl + P para continuar");
    draw_text(_cx, _cy + 40, "ESC - Menu Principal");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}