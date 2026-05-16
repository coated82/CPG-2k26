randomize();

// Vida cresce com a wave
hit_points = clamp(irandom_range(1, global.wave), 1, global.wave + 1);
hit_points_max = hit_points;

current_path = choose(pth_Top, pth_Bottom);

// VELOCIDADE ALEATÓRIA: Isso evita que eles fiquem um em cima do outro
// Cada inimigo terá uma velocidade única entre 0.8 e 1.5 + bônus de wave
speed_current = random_range(0.8, 1.5) + (global.wave * 0.05);
speed_original = speed_current;
speed_timer = 1 * room_speed;

image_speed = 0;
image_index = irandom_range(0, 3);

// Inicia o movimento
path_start(
    current_path,
    speed_current,
    path_action_stop,
    true
);

// Função de dano
hurt = function(_amount = 1) {
    hit_points -= _amount;
    
    if(hit_points <= 0){
        instance_destroy();
    }
}

slow = function(){
		path_speed = speed_current / 2;
		alarm_set(0, speed_timer);
}