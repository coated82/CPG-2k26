randomize();

// --- 1. IDENTIDADE VISUAL ---

path_pause    = false; 
depth         = -50;   
image_xscale  = 0.35;
image_yscale  = 0.35;
base_xscale   = image_xscale;
base_yscale   = image_yscale;
image_speed   = 0;     

// --- 2. STATUS DE VIDA E REGENERAÇÃO ---
hit_points    = 1;      
hp_max        = 1; 
regen_timer   = 0;
regen_delay   = 90; // 1.5 segundos (Equilíbrio entre desafio e justiça)
heal_amount   = 1;  

// --- 3. MATEMÁTICA E FLAGS ---
is_negative   = false;  
is_imaginary  = false; 
is_slowed     = false;
dying         = false;

// --- 4. FUNÇÕES ---
cleanup_signals = function() {
    // Vazio
}

change_num = function() {
    image_index = clamp(hit_points, 0, image_number - 1);
}

slow = function(_reduction = 0.5, _duration = 2) {
    if (!is_slowed) {
        is_slowed = true;
        image_blend = c_aqua; 
        path_speed = path_speed * _reduction;
        alarm[0] = game_get_speed(gamespeed_fps) * _duration;
    }
}

hurt = function(_amount = 1, _source_name = "") {
    if (_source_name == "Subtratora") {
        hit_points -= _amount;
        change_num();
        
        if (hit_points <= 0) {
            die();
        }
    }
}

die = function() {
    global.cash_amount += 10;
    global.gain_cash += 10;
    sprite_index = spr_Amasso;
    image_index = 0;
    image_speed = 4;
    dying = true;
}

// --- 5. INÍCIO ---
current_path   = pathfinder();
speed_original = random_range(0.8, 1.2) + (global.wave * 0.05);
speed_current  = speed_original;

path_start(current_path, speed_current, path_action_stop, true);
change_num();