randomize();

// --- 1. CONFIGURAÇÕES DE ESTADO E VISUAL ---
path_pause     = false; 
depth          = -50;   // Garante que fique à frente de slots e caminhos
image_xscale   = 0.35;
image_yscale   = 0.35;
image_speed    = 0;     

// Atualiza a máscara de colisão
sprite_collision_mask(sprite_index, true, 0, 0, 0, 0, 0, 0, 0);

// --- 2. VARIÁVEIS MATEMÁTICAS ---
hit_points     = -3;    
is_imaginary   = false; // Inicializado como false (o Spawner injetará o valor real)

// Nomes das variáveis de instância alterados para evitar conflito com nomes de objetos
inst_minus_signal     = noone;
inst_imaginary_signal = noone; 

// --- 3. GESTÃO DE SINAIS E SPRITES (A "ALU" VISUAL) ---
change_num = function() {
    // Sincroniza o frame do sprite com o valor numérico
    image_index = abs(hit_points);
    
    // --- Lógica do Sinal Negativo (-) ---
    // Só aparece se for menor que zero E não for imaginário
    if (hit_points < 0 && !is_imaginary) {
        if (!instance_exists(inst_minus_signal)) {
            inst_minus_signal = instance_create_layer(x, y, "Placeables", obj_Minus_Signal);
            inst_minus_signal.parent_obj = id;
        }
    } else {
        if (instance_exists(inst_minus_signal)) {
            instance_destroy(inst_minus_signal);
            inst_minus_signal = noone;
        }
    }

    // --- Lógica do Sinal Imaginário (i) ---
    if (is_imaginary) {
        if (!instance_exists(inst_imaginary_signal)) {
            // Cria o "i" deslocado à direita. Certifique-se que o objeto existe no Asset Browser.
            inst_imaginary_signal = instance_create_layer(x + 20, y, "Placeables", obj_Imaginary_i);
            inst_imaginary_signal.parent_obj = id;
        }
    } else {
        if (instance_exists(inst_imaginary_signal)) {
            instance_destroy(inst_imaginary_signal);
            inst_imaginary_signal = noone;
        }
    }
}

// --- 4. FUNÇÕES DE COMBATE ---

/// @function hurt(amount)
hurt = function(_amount = 1) {
    // IMUNIDADE: Se for imaginário, ignora dano de torres reais (Soma/Sub)
    if (is_imaginary) {
        exit; 
    }

    // 1. Processamento Aritmético
    hit_points -= _amount;
    
    // 2. Sincroniza visuais após o dano
    change_num();
    
    // 3. Checagem de Eliminação
    // O inimigo só "morre" se for um número Real menor ou igual a zero
    if (hit_points <= 0 && !is_imaginary) {
        global.cash_amount += 10;
        
        // CORREÇÃO: Limpeza usando as variáveis de instância corretas
        if (instance_exists(inst_minus_signal))     instance_destroy(inst_minus_signal);
        if (instance_exists(inst_imaginary_signal)) instance_destroy(inst_imaginary_signal);
        
        instance_destroy();
    }
}

/// @function slow()
slow = function() {
    path_speed = speed_current / 2;
    alarm_set(0, speed_timer); 
}

// --- 5. MOVIMENTAÇÃO E INICIALIZAÇÃO ---
current_path   = choose(pth_Top, pth_Bottom);
speed_current  = random_range(0.8, 1.5) + (global.wave * 0.05);
speed_original = speed_current;
speed_timer    = 1 * room_speed;

// Inicia o movimento no path
path_start(current_path, speed_current, path_action_stop, true);

// Primeira execução para definir o estado visual inicial
change_num();

speed_current = path_speed;  // Guarda a velocidade original