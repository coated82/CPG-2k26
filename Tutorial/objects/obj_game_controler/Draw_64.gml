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
    draw_text(_cx, _cy, "Ctrl + P para continuar");
    draw_text(_cx, _cy + 40, "ESC - Menu Principal");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
}

// ========== DESENHA POWER-UP K ==========
if (global.powerup_k_ativo) {
    // ===== CONFIGURAÇÕES DE POSIÇÃO (MEXA AQUI PRA REPOSICIONAR) =====
    // CANTO INFERIOR ESQUERDO
    var _x = 80;                               // Posição X (esquerda: +80)
    var _y = display_get_gui_height() - 80;    // Posição Y (baixo: altura - 80)
    var _raio = 35;                            // Raio do círculo
    var _espessura = 6;                        // Espessura do traço (mais grosso = maior número)
    // =================================================================
    
    // Calcula o ângulo do loading (0 a 360 graus)
    var _tempo_restante = global.powerup_k_timer;
    var _tempo_total = global.powerup_k_tempo_total * room_speed;
    var _porcentagem = 1 - (_tempo_restante / _tempo_total);
    var _angulo = _porcentagem * 360;
    
    // ========== Sombra da Letra K ==========
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, "K");
    draw_set_alpha(1);
    
    // ========== Letra K Principal ==========
    draw_set_colour(c_white);
    draw_text(_x, _y, "K");
    
    // ========== CÍRCULO DE CARGA (GROSSO) ==========
    draw_set_colour(c_lime);  // Verde claro
    draw_set_alpha(0.9);
    
    // Desenha o arco com círculos grossos
    for (var i = 0; i <= _angulo; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _espessura / 2, false);
    }
    draw_set_alpha(1);
    
    // ========== RESET COMPLETO ==========
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ========== MOSTRA COOLDOWN ==========
if (!global.powerup_k_disponivel && !global.powerup_k_ativo && global.powerup_k_cooldown > 0) {
    // ===== CONFIGURAÇÕES DE POSIÇÃO =====
    // CANTO INFERIOR ESQUERDO
    var _x = 80;                               // Posição X (esquerda: +80)
    var _y = display_get_gui_height() - 80;    // Posição Y (baixo: altura - 80)
    var _raio = 35;                            // Raio do círculo
    var _espessura = 6;                        // Espessura do traço
    // ====================================
    
    // Sombra da Letra K
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, "K");
    draw_set_alpha(1);
    
    // Letra K cinza (cooldown)
    draw_set_colour(c_gray);
    draw_set_alpha(0.6);
    draw_text(_x, _y, "K");
    draw_set_alpha(1);
    
    // Círculo cinza (cooldown)
    draw_set_colour(c_gray);
    draw_set_alpha(0.4);
    for (var i = 0; i <= 360; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _espessura / 2, false);
    }
    draw_set_alpha(1);
    
    // ========== RESET COMPLETO ==========
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}