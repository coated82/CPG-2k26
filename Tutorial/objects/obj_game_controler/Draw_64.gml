// ============================================================================
//                          TELA DE PRÉ-FASE (Ctrl + Alt + M)
// ============================================================================
if (global.tipo_pausa == 1) {
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    // Texto de instrução no canto inferior
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_colour(c_black);
    draw_text(_cx, display_get_gui_height() - 620, "Pressione Ctrl + Alt + M para começar");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ============================================================================
//                               MENU DE PAUSA
// ============================================================================
if (global.pausado && global.tipo_pausa == 0) {
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    draw_set_colour(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_Menu);
    draw_set_colour(c_white);
    
    draw_text(_cx, _cy - 50, "JOGO PAUSADO");
    draw_text(_cx, _cy, "Ctrl + P para continuar");
    draw_text(_cx, _cy + 40, "ESC - Menu Principal");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
}

// ============================================================================
//                    POWER-UP C (Ctrl+C) - Copiar Dinheiro
// ============================================================================
if (!global.powerup_copy_disponivel && global.powerup_copy_cooldown > 0) {
    var _x = 80, _y = 150, _raio = 35, _esp = 6, _cor = c_lime, _letra = "C";
    var _cooldown_total_frames = global.powerup_copy_cooldown_total * room_speed;
    var _cooldown_passou = _cooldown_total_frames - global.powerup_copy_cooldown;
    var _angulo = (_cooldown_passou / _cooldown_total_frames) * 360;
    var _segundos = ceil(global.powerup_copy_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Sombra
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    // Letra preta
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text(_x, _y, _letra);
    
    // Círculo de cooldown
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _esp / 2, false);
    }
    draw_set_alpha(1);
    
    // Contador de segundos preto
    draw_set_font(fnt_Menu);
    draw_set_colour(c_black);
    draw_text(_x, _y + _raio + 15, string(_segundos) + "s");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// --- Valor copiado (à direita do C) ---
if (global.dinheiro_copiado > 0 && global.powerup_paste_disponivel && !global.powerup_copy_disponivel) {
    var _x = 80 + 45, _y = 150;  // À direita do círculo do C
    var _valor = string(global.dinheiro_copiado);
    if (global.dinheiro_copiado >= 1000) _valor = string(global.dinheiro_copiado / 1000) + "k";
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_colour(c_black);
    draw_text(_x, _y, "$" + _valor);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ============================================================================
//                    POWER-UP V (Ctrl+V) - Colar Dinheiro
// ============================================================================
if (!global.powerup_paste_disponivel && global.powerup_paste_cooldown > 0) {
    var _x = 80, _y = 270, _raio = 35, _esp = 6, _cor = c_lime, _letra = "V";
    var _cooldown_total_frames = global.powerup_paste_cooldown_total * room_speed;
    var _cooldown_passou = _cooldown_total_frames - global.powerup_paste_cooldown;
    var _angulo = (_cooldown_passou / _cooldown_total_frames) * 360;
    var _segundos = ceil(global.powerup_paste_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text(_x, _y, _letra);
    
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _esp / 2, false);
    }
    draw_set_alpha(1);
    
    draw_set_font(fnt_Menu);
    draw_set_colour(c_black);
    draw_text(_x, _y + _raio + 15, string(_segundos) + "s");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ============================================================================
//                         POWER-UP S (Câmera Lenta)
// ============================================================================

// --- Power-Up S ATIVO (verde escuro, letra branca) ---
if (global.powerup_s_ativo) {
    var _x = 80, _y = 390, _raio = 35, _esp = 6, _cor = make_colour_rgb(0, 100, 0), _letra = "S";
    var _tempo_restante = global.powerup_s_timer;
    var _tempo_total = global.powerup_s_tempo_total * room_speed;
    var _angulo = (1 - (_tempo_restante / _tempo_total)) * 360;
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    draw_set_colour(c_white);
    draw_set_alpha(1);
    draw_text(_x, _y, _letra);
    
    draw_set_colour(_cor);
    draw_set_alpha(0.9);
    for (var i = 0; i <= _angulo; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _esp / 2, false);
    }
    draw_set_alpha(1);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// --- Power-Up S COOLDOWN (verde claro, letra preta) ---
if (!global.powerup_s_disponivel && !global.powerup_s_ativo && global.powerup_s_cooldown > 0) {
    var _x = 80, _y = 390, _raio = 35, _esp = 6, _cor = c_lime, _letra = "S";
    var _cooldown_restante = global.powerup_s_cooldown;
    var _cooldown_total = global.powerup_s_cooldown_total * room_speed;
    var _angulo = (1 - (_cooldown_restante / _cooldown_total)) * 360;
    var _segundos = ceil(global.powerup_s_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text(_x, _y, _letra);
    
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _esp / 2, false);
    }
    draw_set_alpha(1);
    
    draw_set_font(fnt_Menu);
    draw_set_colour(c_black);
    draw_text(_x, _y + _raio + 15, string(_segundos) + "s");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ============================================================================
//                         POWER-UP K (Mata Inimigos)
// ============================================================================
if (!global.powerup_k_disponivel && global.powerup_k_cooldown > 0) {
    var _x = 80, _y = 510, _raio = 35, _esp = 6, _cor = c_lime, _letra = "K";
    var _cooldown_total_frames = global.powerup_k_cooldown_total * room_speed;
    var _cooldown_passou = _cooldown_total_frames - global.powerup_k_cooldown;
    var _angulo = (_cooldown_passou / _cooldown_total_frames) * 360;
    var _segundos = ceil(global.powerup_k_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text(_x, _y, _letra);
    
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _esp / 2, false);
    }
    draw_set_alpha(1);
    
    draw_set_font(fnt_Menu);
    draw_set_colour(c_black);
    draw_text(_x, _y + _raio + 15, string(_segundos) + "s");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}