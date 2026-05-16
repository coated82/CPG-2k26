global.wave += 1;

// 1. DEFINA A VARIÁVEL PRIMEIRO
// Se o seu jogo roda a 60 FPS, 180 frames equivalem a 3 segundos.
timer_next_wave = 180; 

repeat(floor(global.wave * 1.5)){
    instance_create_depth(
        -100,
        -100,
        get_layer_depth(LAYER.enemy),
        obj_Enemy
    );
}

// 2. AGORA VOCÊ PODE USAR ELA
alarm_set(0, timer_next_wave);