// --- 1. STATUS DE TANQUE (X) ---
hit_points = 80;   
hp_max = 80;       
speed_original = 0.4; // MOAB Style
speed_current  = speed_original;

// --- 2. IDENTIDADE VISUAL ---
image_xscale = 0.5; 
image_yscale = 0.5;
image_blend  = make_color_rgb(180, 180, 180); // Um pouco mais escuro que o normal

// --- 3. REFERÊNCIAS DE SLOT (SEGURANÇA) ---
my_slot_x = x;
my_slot_y = y;
is_slowed = false; // Necessário para não dar erro no Step principal
dying = false;     // Necessário para não dar erro no Begin Step do Parent

// --- 4. FUNÇÕES DO INIMIGO ---

// O Boss X não muda de número e não gera sinais, então a função fica vazia para não dar erro no Spawner!
change_num = function() {
    // Não faz nada. Ele é sempre um X.
}

// Lógica de receber dano exclusiva do Boss
// Sobrescrevendo a função hurt para o Boss X com log de HP
hurt = function(_amount = 1, _source_name = "") {
    if (is_imaginary) exit; 

    var _can_be_hit = false;
    if (is_negative && _source_name == "Somadora") _can_be_hit = true;
    if (!is_negative && _source_name == "Subtratora") _can_be_hit = true;

    if (_can_be_hit) {
        hit_points -= _amount;
        
        // --- LOG DE DEBUG AQUI ---
        show_debug_message(">>> BOSS X TOMOU DANO! HP Restante: " + string(hit_points) + " / " + string(hp_max));
        
        // Verifica a morte
        if (hit_points <= 0) { 
            show_debug_message(">>> BOSS X FOI DESTRUÍDO! <<<");
            global.cash_amount += 50; 
            global.gain_cash += 50;
            instance_destroy();
        }
    }
}

// --- 5. INÍCIO DO MOVIMENTO ---
current_path = pathfinder();
path_start(current_path, speed_current, path_action_stop, true);