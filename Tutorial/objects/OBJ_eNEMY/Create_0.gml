randomize();

path_pause = false;  // pra fazer essa porra pausar

// Muda o taanho da imagem e da mascara de colisao
// 1. Configurações Visuais
image_xscale = 0.35;
image_yscale = 0.35;

// Atualiza bbox automaticamente
sprite_collision_mask(sprite_index, true, 0, 0, 0, 0, 0, 0, 0);

// 2. Variável de sinal (Para controle interno)
minus = noone;

// 3. Função de trocar o sprite e gerenciar o sinal
change_num = function() {
    image_index = abs(hit_points);
    
    // Se for negativo e o sinal ainda não existir, cria o sinal
    if (hit_points < 0) {
        if (!instance_exists(minus)) {
            minus = instance_create_layer(x, y, "Placeables", obj_Minus_Signal);
            minus.parent_obj = id;
        }
    } else {
        // Se o valor virou positivo ou zero, destrói o sinal
        if (instance_exists(minus)) {
            instance_destroy(minus);
            minus = noone;
        }
    }
}

// 4. Inicialização da Vida
hit_points = -3; // Exemplo de valor inicial
hit_points_max = hit_points;
change_num();

// 5. Movimentação
current_path = choose(pth_Top, pth_Bottom);
speed_current = random_range(0.8, 1.5) + (global.wave * 0.05);
speed_original = speed_current;
speed_timer = 1 * room_speed;

path_start(current_path, speed_current, path_action_stop, true);

// 6. Função de Dano (Hurt)// No Create do obj_Enemy
hurt = function(_amount = 1) {
    // 1. Subtrai o dano (ex: 3 - 1 = 2)
    hit_points -= _amount; 
    
    // 2. Atualiza o sprite para o número correto
    change_num();
    
    // 3. DEBUG (Para você ver a mágica no console)
    show_debug_message("HP Atual: " + string(hit_points));
    
    // 4. A CORREÇÃO: Só morre se for zero ou menos
    // Usamos <= 0 porque se o dano for maior que a vida, ele também morre
    if (hit_points <= 0) {
        global.cash_amount += 10;
        
        // Limpa o sinal de menos se ele existir
        if (instance_exists(minus)) instance_destroy(minus);
        
        instance_destroy();
    }
}

// 7. Funções de Status
slow = function() {
    path_speed = speed_current / 2;
    alarm_set(0, speed_timer);
}