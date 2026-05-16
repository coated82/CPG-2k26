randomize();

// Muda o taanho da imagem e da mascara de colisao
image_xscale = 0.35;
image_yscale = 0.35;

// atualiza bbox automaticamente
sprite_collision_mask(
    sprite_index,
    true,
    0,
    0,
    0,
    0,
    0,
    0,
    0
);

// Vida cresce com a wave
hit_points = 67;
hit_points_max = hit_points;
image_index = hit_points;

current_path = choose(pth_Top, pth_Bottom);

// VELOCIDADE ALEATÓRIA: Isso evita que eles fiquem um em cima do outro
// Cada inimigo terá uma velocidade única entre 0.8 e 1.5 + bônus de wave
speed_current = random_range(0.8, 1.5) + (global.wave * 0.05);
speed_original = speed_current;
speed_timer = 1 * room_speed;

// Inicia o movimento
path_start(
    current_path,
    speed_current,
    path_action_stop,
    true
);
//


// Função de dano
hurt = function(_amount = 1) {
    hit_points -= _amount;
    image_index = hit_points;
	
    if(hit_points <= 0){
		global.cash_amount += 10;
		
        instance_destroy();
    }
}

slow = function(){
		path_speed = speed_current / 2;
		alarm_set(0, speed_timer);
}