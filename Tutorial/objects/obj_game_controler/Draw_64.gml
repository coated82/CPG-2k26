// ============================================================================
//                          TELA DE PRÉ-FASE (Pronto?)
// ============================================================================
if (global.tipo_pausa == 1) {
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    // Fundo escuro
    draw_set_colour(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
    // Texto piscando
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _alpha = 0.5 + (dsin(current_time * 0.005) * 0.3);
    draw_set_alpha(_alpha);
    draw_set_colour(c_white);
    draw_text(_cx, _cy - 40, "PRONTO?");
    
    draw_set_alpha(1);
    draw_set_colour(c_lime);
    draw_text(_cx, _cy + 20, "Clique para começar");
    
    // Instrução
    draw_set_font(-1);
    draw_set_colour(c_gray);
    draw_set_alpha(0.7);
    draw_text(_cx, _cy + 80, "Clique com o mouse ou pressione ESPAÇO/ENTER");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
    draw_set_alpha(1);
}

// ============================================================================
//                          TELA DE CONTAGEM REGRESSIVA
// ============================================================================
if (global.tipo_pausa == 2) {
    var _cx = display_get_gui_width() / 2;
    var _cy = display_get_gui_height() / 2;
    
    // Fundo escuro
    draw_set_colour(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
    // Número da contagem
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Cor baseada no número
    switch(global.contagem_valor) {
        case 3: draw_set_colour(c_red); break;
        case 2: draw_set_colour(c_yellow); break;
        case 1: draw_set_colour(c_lime); break;
    }
    
    var _escala = 2.5 + (dsin(current_time * 0.01) * 0.2);
    draw_text_transformed(_cx, _cy, string(global.contagem_valor), _escala, _escala, 0);
    
    // Texto "VAI!" quando acabar (opcional)
    if (global.contagem_valor <= 0) {
        draw_set_colour(c_lime);
        draw_text(_cx, _cy + 100, "VAI!");
    }
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ============================================================================
//                               MENU DE PAUSA
// ============================================================================
// SÓ MOSTRA O MENU DE PAUSA se for pause normal (tipo_pausa == 0)
if (global.pausado && global.tipo_pausa == 0) {
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

// ============================================================================
//                    POWER-UP C (Ctrl+C) - Copiar Dinheiro
//                    Tipo: Instantâneo | Cooldown: 30s
// ============================================================================

// --- COPY COOLDOWN (só aparece depois de usar) ---
if (!global.powerup_copy_disponivel && global.powerup_copy_cooldown > 0) {
    var _x = 80;                               // Posição X (esquerda)
    var _y = 150;                              // Posição Y (abaixado)
    var _raio = 35;
    var _espessura = 6;
    var _cor = c_lime;                         // Verde claro
    var _letra = "C";
    
    // Cálculo do ângulo de regeneração
    var _cooldown_total_frames = global.powerup_copy_cooldown_total * room_speed;
    var _cooldown_passou = _cooldown_total_frames - global.powerup_copy_cooldown;
    var _porcentagem_cooldown = _cooldown_passou / _cooldown_total_frames;
    var _angulo_cooldown = _porcentagem_cooldown * 360;
    var _segundos_cooldown = ceil(global.powerup_copy_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Sombra
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    // Letra
    draw_set_colour(_cor);
    draw_set_alpha(0.6);
    draw_text(_x, _y, _letra);
    
    // Círculo de cooldown
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo_cooldown; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _espessura / 2, false);
    }
    draw_set_alpha(1);
    
    // Contador de segundos
    draw_set_font(-1);
    draw_set_colour(c_white);
    draw_text(_x, _y + _raio + 15, string(_segundos_cooldown) + "s");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// --- Mostra o valor copiado (abaixo do C) ---
if (global.dinheiro_copiado > 0 && global.powerup_paste_disponivel && !global.powerup_copy_disponivel) {
    var _x = 80;
    var _y = 150;
    var _raio = 35;
    
    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_colour(c_lime);  // Verde claro
    
    // Formata o valor
    var _valor_texto = string(global.dinheiro_copiado);
    if (global.dinheiro_copiado >= 1000) {
        _valor_texto = string(global.dinheiro_copiado / 1000) + "k";
    }
    
    draw_text(_x, _y + _raio + 5, _valor_texto);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(c_white);
}

// ============================================================================
//                    POWER-UP V (Ctrl+V) - Colar Dinheiro
//                    Tipo: Instantâneo | Cooldown: 30s
// ============================================================================

// --- PASTE COOLDOWN (só aparece depois de usar) ---
if (!global.powerup_paste_disponivel && global.powerup_paste_cooldown > 0) {
    var _x = 80;
    var _y = 250;                              // Posição Y (100px abaixo do C)
    var _raio = 35;
    var _espessura = 6;
    var _cor = c_lime;                         // Verde claro
    var _letra = "V";
    
    // Cálculo do ângulo de regeneração
    var _cooldown_total_frames = global.powerup_paste_cooldown_total * room_speed;
    var _cooldown_passou = _cooldown_total_frames - global.powerup_paste_cooldown;
    var _porcentagem_cooldown = _cooldown_passou / _cooldown_total_frames;
    var _angulo_cooldown = _porcentagem_cooldown * 360;
    var _segundos_cooldown = ceil(global.powerup_paste_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Sombra
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    // Letra
    draw_set_colour(_cor);
    draw_set_alpha(0.6);
    draw_text(_x, _y, _letra);
    
    // Círculo de cooldown
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo_cooldown; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _espessura / 2, false);
    }
    draw_set_alpha(1);
    
    // Contador de segundos
    draw_set_font(-1);
    draw_set_colour(c_white);
    draw_text(_x, _y + _raio + 15, string(_segundos_cooldown) + "s");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ============================================================================
//                         POWER-UP S (Câmera Lenta)
//                    Tipo: Duradouro | Duração: 10s | Cooldown: 15s
// ============================================================================

// --- Power-Up S ATIVO (círculo carregando) ---
if (global.powerup_s_ativo) {
    var _x = 80;
    var _y = 350;                              // Posição Y (100px abaixo do V)
    var _raio = 35;
    var _espessura = 6;
    var _cor = c_lime;                         // Verde claro
    var _letra = "S";
    
    // Cálculo do ângulo de progresso
    var _tempo_restante = global.powerup_s_timer;
    var _tempo_total = global.powerup_s_tempo_total * room_speed;
    var _porcentagem = 1 - (_tempo_restante / _tempo_total);
    var _angulo = _porcentagem * 360;
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Sombra
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    // Letra principal
    draw_set_colour(c_white);
    draw_set_alpha(1);
    draw_text(_x, _y, _letra);
    
    // Círculo de carga
    draw_set_colour(_cor);
    draw_set_alpha(0.9);
    for (var i = 0; i <= _angulo; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _espessura / 2, false);
    }
    draw_set_alpha(1);
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// --- Power-Up S COOLDOWN (só aparece depois do uso) ---
if (!global.powerup_s_disponivel && !global.powerup_s_ativo && global.powerup_s_cooldown > 0) {
    var _x = 80;
    var _y = 350;                              // Posição Y
    var _raio = 35;
    var _espessura = 6;
    var _cor = c_lime;                         // Verde claro
    var _letra = "S";
    
    // Cálculo do ângulo de regeneração
    var _cooldown_restante = global.powerup_s_cooldown;
    var _cooldown_total = global.powerup_s_cooldown_total * room_speed;
    var _porcentagem_cooldown = 1 - (_cooldown_restante / _cooldown_total);
    var _angulo_cooldown = _porcentagem_cooldown * 360;
    var _segundos_cooldown = ceil(global.powerup_s_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Sombra
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    // Letra
    draw_set_colour(_cor);
    draw_set_alpha(0.6);
    draw_text(_x, _y, _letra);
    
    // Círculo de cooldown
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo_cooldown; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _espessura / 2, false);
    }
    draw_set_alpha(1);
    
    // Contador de segundos
    draw_set_font(-1);
    draw_set_colour(c_white);
    draw_text(_x, _y + _raio + 15, string(_segundos_cooldown) + "s");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}

// ============================================================================
//                         POWER-UP K (Mata Inimigos)
//                    Tipo: Instantâneo | Cooldown: 20s
// ============================================================================

// --- Power-Up K COOLDOWN (só aparece depois de usar) ---
if (!global.powerup_k_disponivel && global.powerup_k_cooldown > 0) {
    var _x = 80;
    var _y = 450;                              // Posição Y (100px abaixo do S)
    var _raio = 35;
    var _espessura = 6;
    var _cor = c_lime;                         // Verde claro
    var _letra = "K";
    
    // Cálculo do ângulo de regeneração
    var _cooldown_total_frames = global.powerup_k_cooldown_total * room_speed;
    var _cooldown_passou = _cooldown_total_frames - global.powerup_k_cooldown;
    var _porcentagem_cooldown = _cooldown_passou / _cooldown_total_frames;
    var _angulo_cooldown = _porcentagem_cooldown * 360;
    var _segundos_cooldown = ceil(global.powerup_k_cooldown / room_speed);
    
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Sombra
    draw_set_colour(c_black);
    draw_set_alpha(0.3);
    draw_text(_x + 2, _y + 2, _letra);
    
    // Letra
    draw_set_colour(_cor);
    draw_set_alpha(0.6);
    draw_text(_x, _y, _letra);
    
    // Círculo de cooldown
    draw_set_colour(_cor);
    draw_set_alpha(0.3);
    for (var i = 0; i <= _angulo_cooldown; i += 3) {
        var _xx = _x + _raio * dcos(i);
        var _yy = _y + _raio * dsin(-i);
        draw_circle(_xx, _yy, _espessura / 2, false);
    }
    draw_set_alpha(1);
    
    // Contador de segundos
    draw_set_font(-1);
    draw_set_colour(c_white);
    draw_text(_x, _y + _raio + 15, string(_segundos_cooldown) + "s");
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_colour(c_white);
}