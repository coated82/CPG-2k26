// --- 1. CONFIGURAÇÕES DE POSIÇÃO E COR ---
var _bx = 40;     
var _by = 100;     
var _cor_azul = make_color_rgb(0, 50, 150); 

// --- 2. DESENHO DO BOTÃO ---
draw_set_circle_precision(64);
draw_set_color(_cor_azul);
draw_circle(_bx, _by, 15, false); 

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Proteção para a fonte
if (asset_get_index("fnt_info_pequena") != -1) {
    draw_set_font(fnt_info_pequena);
} else {
    draw_set_font(-1); 
}

draw_text(_bx, _by, "i");

// --- 3. DESENHO DA JANELA DE AJUDA ---
if (aberto) {
    var _jw = 420; 
    var _jh = 280; 
    var _jx = _bx + 25; 
    var _jy = _by + 25; 

    // Fundo da Janela
    draw_set_alpha(0.9);
    draw_set_color(c_black);
    draw_rectangle(_jx, _jy, _jx + _jw, _jy + _jh, false);
    
    // Borda da Janela
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(_jx, _jy, _jx + _jw, _jy + _jh, true);

    // Alinhamento do Texto
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Texto montado de forma simples para evitar o erro DoAdd
    var _linha1 = "GUIA DE COMANDOS:";
    var _linha2 = "Ctrl + Alt + C: Copiar dinheiro";
    var _linha3 = "Ctrl + Alt + V: Colar dinheiro";
    var _linha4 = "Ctrl + Alt + S: Reduz vel. inimigos";
    var _linha5 = "Ctrl + Alt + K: Matar inimigos";
    var _linha6 = "Ctrl + Alt + P: Pausar jogo";

    var _pulo = 28; // Espaçamento entre linhas
    
    draw_text(_jx + 25, _jy + 25, _linha1);
    draw_text(_jx + 25, _jy + 25 + (_pulo * 2), _linha2);
    draw_text(_jx + 25, _jy + 25 + (_pulo * 3), _linha3);
    draw_text(_jx + 25, _jy + 25 + (_pulo * 4), _linha4);
    draw_text(_jx + 25, _jy + 25 + (_pulo * 5), _linha5);
    draw_text(_jx + 25, _jy + 25 + (_pulo * 7), _linha6);
}

// --- 4. RESET DE PADRÕES ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_font(-1);