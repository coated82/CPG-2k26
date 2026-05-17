// ============================================================================
//                          DESENHA SELEÇÃO DE FASES
// ============================================================================

var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;

// Título (preto porque fundo é branco)
draw_set_font(fnt_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);
draw_text(_cx, 100, "SELECIONE UMA FASE");

// ========== SPRITES DAS FASES (3 fases - Com mais espaçamento) ==========
var _total_fases = array_length(mapas);  // = 3
var _sprite_w = 200;                      // Largura do sprite
var _sprite_h = 200;                      // Altura do sprite
var _espaco = 120;                        // Espaço entre eles

// Calcula a largura total ocupada
var _largura_total = (_total_fases * _sprite_w) + ((_total_fases - 1) * _espaco);

// Centraliza os sprites na tela
var _start_x = _cx - (_largura_total / 2);
var _start_y = 180;

for (var i = 0; i < _total_fases; i++) {
    var _bx = _start_x + (i * (_sprite_w + _espaco));
    var _by = _start_y;
    
    // Salva as posições para o STEP
    mapas[i].x = _bx;
    mapas[i].y = _by;
    mapas[i].w = _sprite_w;
    mapas[i].h = _sprite_h;
    
    // ===== DESENHA O SPRITE =====
    if (mapas[i].liberado) {
        // Fase liberada
        if (i == indice_selecionado) {
            // Selecionada: amarelada e maior
            draw_sprite_ext(mapas[i].sprite, 0, 
                _bx + _sprite_w/2, _by + _sprite_h/2, 
                1.15, 1.15, 0, c_yellow, 0.8);
        } else {
            // Normal
            draw_sprite_ext(mapas[i].sprite, 0, 
                _bx + _sprite_w/2, _by + _sprite_h/2, 
                1.0, 1.0, 0, c_white, 1);
        }
    } else {
        // Fase bloqueada
        draw_set_colour(c_gray);
        draw_set_alpha(0.4);
        draw_rectangle(_bx, _by, _bx + _sprite_w, _by + _sprite_h, false);
        draw_set_alpha(1);
        draw_set_colour(c_black);  // Texto preto
        draw_set_font(fnt_Menu);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(_bx + _sprite_w/2, _by + _sprite_h/2, "🔒");
    }
    
    // ===== NOME DA FASE (Fonte preta) =====
    draw_set_font(fnt_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    if (mapas[i].liberado) {
        draw_set_colour(i == indice_selecionado ? c_yellow : c_black);
    } else {
        draw_set_colour(c_gray);
        draw_set_alpha(0.7);
    }
    draw_text(_bx + _sprite_w/2, _by + _sprite_h + 20, mapas[i].nome);
    
    // ===== TEXTO "EM BREVE" =====
    if (!mapas[i].liberado) {
        draw_set_font(fnt_Menu);
        draw_set_colour(c_orange);
        draw_set_alpha(0.8);
        draw_text(_bx + _sprite_w/2, _by + _sprite_h + 50, "EM BREVE");
        draw_set_alpha(1);
    }
}

// ========== INSTRUÇÕES (Fonte preta) ==========
draw_set_font(fnt_Menu);
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(_cx, display_get_gui_height() - 80, "Clique no mapa | <-  ->  | ENTER | ESC para voltar");

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_set_colour(c_white);
draw_set_alpha(1);