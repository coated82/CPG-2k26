// --- 1. DESENHA O BOTÃO "i" ---
var _bx = 30; 
var _by = 100; 

draw_set_circle_precision(64);
draw_set_color(c_blue);
draw_circle(_bx, _by, 15, false); 

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// TENTEI USAR SUA FONTE, SE NÃO EXISTIR, USO A PADRÃO
if (asset_get_index("fnt_info_pequena") != -1) {
    draw_set_font(fnt_info_pequena);
} else {
    draw_set_font(-1); 
}

draw_text(_bx, _by, "i");

// --- 2. JANELA DE AJUDA ---
if (aberto) {
    var _jw = 400; 
    var _jh = 250; 
    var _jx = _bx + 30; 
    var _jy = _by + 30; 

    draw_set_color(c_black);
    draw_set_alpha(0.9);
    draw_rectangle(_jx, _jy, _jx + _jw, _jy + _jh, false);
    
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_rectangle(_jx, _jy, _jx + _jw, _jy + _jh, true);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    var _texto_ajuda = "GUIA DE COMANDOS:\n\n" +
                       "Ctrl + K: Iniciar Wave\n" +
                       "P: Pausar Jogo\n" +
                       "Ctrl + S: Iniciar Wave\n" +
                       "Ctrl + C: Copia dinheiro\n" +
                       "Ctrl + V: Colar Dinheiro\n" +

    draw_text_ext(_jx + 20, _jy + 20, _texto_ajuda, 25, _jw - 40);
}

// Reset padrão para não bugar outros textos da HUD
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);