// ============================================================================
//                          NAVEGAÇÃO COM MOUSE
// ============================================================================

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Verifica qual fase o mouse está em cima
for (var i = 0; i < array_length(mapas); i++) {
    var _x1 = mapas[i].x;
    var _y1 = mapas[i].y;
    var _x2 = _x1 + mapas[i].w;
    var _y2 = _y1 + mapas[i].h;
    
    if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
        indice_selecionado = i;
        
        // Clique para selecionar (só se estiver liberado)
        if (mouse_check_button_pressed(mb_left) && mapas[i].liberado) {
			global.fase_atual = mapas[i].nome;
            room_goto(mapas[i].room);
        }
    }
}

// Teclado também
if (keyboard_check_pressed(vk_right)) {
    indice_selecionado++;
    if (indice_selecionado >= array_length(mapas)) {
        indice_selecionado = 0;
    }
}
if (keyboard_check_pressed(vk_left)) {
    indice_selecionado--;
    if (indice_selecionado < 0) {
        indice_selecionado = array_length(mapas) - 1;
    }
}

// Enter seleciona (só se estiver liberado)
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    if (mapas[indice_selecionado].liberado) {
        room_goto(mapas[indice_selecionado].room);
    }
}

// Voltar ao menu
if (keyboard_check_pressed(vk_escape)) {
    room_goto(rm_Menu);
}

tempo_anim++;