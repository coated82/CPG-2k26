// Pegamos o centro da GUI atual
var _gx = display_get_gui_width() / 2;
var _gy = display_get_gui_height() / 2;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Área de clique baseada no centro
var _x1 = _gx - (largura_customizada / 2);
var _x2 = _gx + (largura_customizada / 2);
var _y1 = _gy - 20;  // Altura de detecção
var _y2 = _gy + 20;

// Lógica de clique e arrasto
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
        arrastando = true;
    }
}

if (mouse_check_button_released(mb_left)) {
    arrastando = false;
}

// Atualiza volume enquanto arrasta
if (arrastando) {
    // Calcula posição relativa do mouse dentro da barra
    var _pos = (_mx - _x1) / largura_customizada;
    valor_volume = clamp(_pos, 0, 1);
    audio_master_gain(valor_volume);
}

if (keyboard_check_pressed(vk_escape)) {
    room_goto(rm_Menu);
}