// 1. Pegar posição do mouse na GUI
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// 2. Definir a área do botão (ajuste conforme o tamanho do seu ícone)
// Como sua sprite é 32x32, vamos checar um quadrado ao redor do X e Y do objeto
var _size = 32; 
var _hover = point_in_rectangle(_mx, _my, x - _size, y - _size, x + _size, y + _size);

// 3. Lógica do Tooltip
if (_hover) {
    global.tooltip_text = description;
	show_debug_message("MOUSE EM CIMA: " + name); 
} else {
    // Só apaga se o texto que está lá for o DESTA torre
    if (global.tooltip_text == description) {
        global.tooltip_text = "";
    }
}