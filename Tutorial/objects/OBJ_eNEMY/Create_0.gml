randomize();

// --- 1. CONFIGURAÇÕES ---
path_pause    = false; 
depth         = -50;   
image_xscale  = 0.35;
image_yscale  = 0.35;
image_speed   = 0;     
hit_points    = 1;      
is_negative   = false;  
is_imaginary  = true; 
inst_minus_signal     = noone;
inst_imaginary_signal = noone; 
// VARIÁVEIS DE LENTIDÃO (DIVISORA)
is_slowed = false;

// --- 2. FUNÇÃO DE LIMPEZA ---
cleanup_signals = function() {
    if (instance_exists(inst_minus_signal))     instance_destroy(inst_minus_signal);
    if (instance_exists(inst_imaginary_signal)) instance_destroy(inst_imaginary_signal);
}

// --- 3. GESTÃO VISUAL ---
change_num = function() {
    image_index = clamp(hit_points, 0, image_number - 1);
    
    if (is_negative) {
        if (!instance_exists(inst_minus_signal)) {
            inst_minus_signal = instance_create_layer(x, y, "Placeables", obj_Minus_Signal);
            if (inst_minus_signal != noone) inst_minus_signal.parent_obj = id;
        }
    } else if (instance_exists(inst_minus_signal)) {
        instance_destroy(inst_minus_signal);
        inst_minus_signal = noone;
    }

    if (is_imaginary) {
        if (!instance_exists(inst_imaginary_signal)) {
            inst_imaginary_signal = instance_create_layer(x + 20, y, "Placeables", obj_Imaginary_i);
            if (inst_imaginary_signal != noone) inst_imaginary_signal.parent_obj = id;
        }
    } else if (instance_exists(inst_imaginary_signal)) {
        instance_destroy(inst_imaginary_signal);
        inst_imaginary_signal = noone;
    }
}

// --- 4. FUNÇÃO DE LENTIDÃO (CHAMADA PELA BALA) ---
slow = function(_reduction = 0.5, _duration = 2) {
    if (!is_slowed) {
        is_slowed = true;
        image_blend = c_aqua; // Feedback visual azulado
        
        // Aplica a redução na velocidade atual
        path_speed = path_speed * _reduction;
        
        // Define alarme para acabar o efeito (frames)
        alarm[0] = game_get_speed(gamespeed_fps) * _duration;
    }
}

// --- 5. FUNÇÃO DE DANO (FIREWALL) ---
hurt = function(_amount = 1, _source_name = "") {
    if (is_imaginary) exit; 

    var _can_be_hit = false;
    if (is_negative && _source_name == "Somadora") _can_be_hit = true;
    if (!is_negative && _source_name == "Subtratora") _can_be_hit = true;

    if (_can_be_hit) {
        hit_points -= _amount;
        change_num();
        
        if (hit_points <= 0) { 
            global.cash_amount += 10;
			global.gain_cash += 10;
            cleanup_signals();
            instance_destroy();
        }
    }
}

// --- 6. INÍCIO ---
current_path   = pathfinder();
speed_original = random_range(0.8, 1.5) + (global.wave * 0.05);
speed_current  = speed_original;

path_start(current_path, speed_current, path_action_stop, true);
change_num();