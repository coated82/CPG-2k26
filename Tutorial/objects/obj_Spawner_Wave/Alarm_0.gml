if (global.pausado) exit;

// 1. Avança para a próxima wave
global.wave += 1;

// 2. Calcula e cria os inimigos
// O repeat garante que nasçam vários, não apenas um
var _quantidade = floor(global.wave * 1.5);

repeat(_quantidade) {
    instance_create_depth(
        -100, 
        -100, 
        get_layer_depth(LAYER.enemy), 
        obj_Enemy
    );
}

// 3. Define o tempo de espera para a PRÓXIMA wave (ex: 5 segundos)
// Usamos game_get_speed para garantir que o tempo seja real independente do FPS
var _tempo_espera = game_get_speed(gamespeed_fps) * 5;
alarm_set(0, _tempo_espera);

show_debug_message("Wave " + string(global.wave) + " iniciada com " + string(_quantidade) + " inimigos!");