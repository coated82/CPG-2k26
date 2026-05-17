// 1. Pega a posição do mouse em relação à interface (GUI)
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// 2. Define a mesma área do círculo que desenhamos no Draw GUI
var _bx = 30; // Mesma posição X do desenho
var _by = 100; // Mesma posição Y do desenho
var _raio = 20; // Área de clique (um pouco maior que o desenho para facilitar)

// 3. Verifica o clique
if (mouse_check_button_pressed(mb_left)) {
    // Calcula a distância do mouse até o centro do botão
    if (point_distance(_mx, _my, _bx, _by) < _raio) {
        aberto = !aberto; // Inverte o estado da janela
        
        // Opcional: Efeito visual de clique ou som
        // audio_play_sound(snd_click, 1, false);
    } 
    // Opcional: Fechar a janela se clicar fora dela enquanto estiver aberta
    else if (aberto) {
        var _jw = 400;
        var _jh = 250;
        // Se clicar fora da área da janela preta, ela fecha
        if (!point_in_rectangle(_mx, _my, _bx + 30, _by + 30, _bx + 30 + _jw, _by + 30 + _jh)) {
            aberto = false;
        }
    }
}