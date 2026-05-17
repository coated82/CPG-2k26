if (global.pausado) exit;

// ============================================================================
//                          RESETAR TUDO
// ============================================================================

global.tipo_pausa = 0;
global.pausado = false;
global.wave = 0;

global.hitpoints = 6;
global.cash_amount = 100;

// ========== ENTRADA DO TECLADO ==========
var _tecla_baixo = keyboard_check_pressed(vk_down);
var _tecla_cima = keyboard_check_pressed(vk_up);
var _tecla_enter = keyboard_check_pressed(vk_enter);
var _tecla_espaco = keyboard_check_pressed(vk_space);

// Navegação pelo teclado
if (_tecla_baixo) {
    atual = (atual + 1) % array_length(menu);
    margem = 0;  // Reseta a animação
}

if (_tecla_cima) {
    atual = (atual - 1 + array_length(menu)) % array_length(menu);
    margem = 0;
}

// Seleciona com Enter ou Espaço
if (_tecla_enter || _tecla_espaco) {
    menu[atual].funcao();
}

// ========== ENTRADA DO MOUSE ==========
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

for (var i = 0; i < array_length(menu); i++) {
    var _item_topo = menu_y_base + (altura_linha * i) + 50 * i;
    var _item_fundo = _item_topo + altura_linha;
    
    // Detecta hover do mouse
    if (point_in_rectangle(_mx, _my, menu_x, _item_topo, display_get_gui_width(), _item_fundo)) {
        if (atual != i) {
            atual = i;
            margem = 0;
        }
        
        // Clique do mouse
        if (mouse_check_button_pressed(mb_left)) {
            menu[i].funcao();
        }
    }
}

// ========== ANIMAÇÃO DA MARGEM ==========
margem = lerp(margem, 15, 0.2); // Desliza suavemente