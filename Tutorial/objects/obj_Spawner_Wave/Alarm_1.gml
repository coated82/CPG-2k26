//==================================
// --- ALARME 1: Spawner de Inimigos (VERSÃO BALANCEADA INFINITA) ---
//==================================

if (enemies_to_spawn > 0) {
    // 1. SELETOR DE OBJETO
    var _obj_to_spawn = obj_Enemy;
    
    if (global.wave >= 15 && global.wave % 5 == 0 && enemies_to_spawn == 1) {
        _obj_to_spawn = obj_Enemy_X;
    }
    else if (global.wave >= 7) {
        if (irandom(100) <= 20) { 
            _obj_to_spawn = obj_Enemy_heal; 
        }
    }

    // 2. CRIAÇÃO DA INSTÂNCIA
    var _inst = instance_create_depth(x, y, get_layer_depth(LAYER.enemy), _obj_to_spawn);
    
    // 3. CÁLCULO DE ATRIBUTOS
    var _hp_base = 2; 
    var _multiplicador = ceil(global.wave / 3); 
    var _hp_final = _hp_base * _multiplicador; 
    
    if (_obj_to_spawn != obj_Enemy_X) {
        _hp_final = clamp(_hp_final, 1, 99);
    } else {
        _hp_final = 100 + (global.wave * 10);
    }
    
    var _vel_final = 0.8 + (global.wave * 0.015);
    
    if (_obj_to_spawn == obj_Enemy_heal) {
        _hp_final = clamp(_hp_final + 5, 1, 99);
        _vel_final *= 1.1;
    }
    
    // 4. SELETOR MATEMÁTICO (SINAIS E IMAGINÁRIOS)
    var _is_negative = false;   
    var _is_imaginary = false;   

    // --- TRAVA DE SEGURANÇA: HEAL É SEMPRE POSITIVO E REAL ---
    if (_obj_to_spawn == obj_Enemy_heal) {
        _is_negative = false;
        _is_imaginary = false;
    } 
    else {
        // Regras normais para outros inimigos
        if (global.wave <= 3) {
            _is_negative = false;
            _is_imaginary = false;
        } 
        else if (global.wave < 11) {
            if (choose(0, 1) == 1) _is_negative = true;
        }
        else {
            var _sorteio = irandom(3); 
            if (_sorteio == 1) _is_negative = true;
            else if (_sorteio >= 2) { 
                _is_negative = true; 
                _is_imaginary = true;
            }
        }
    }
    
    // 5. INJEÇÃO DOS DADOS
    _inst.hit_points = _hp_final;
    _inst.hp_max = _hp_final;      
    _inst.speed_original = _vel_final;
    _inst.path_speed = _vel_final;
    _inst.is_negative = _is_negative;  
    _inst.is_imaginary = _is_imaginary; 
    
    with(_inst) { 
        if (variable_instance_exists(id, "change_num")) {
            change_num(); 
        }
    }

    // 6. CONTROLE E DELAY
    enemies_to_spawn -= 1;
    var _current_delay = max(30, 70 - (global.wave * 1)); 
    alarm[1] = _current_delay; 

} else {
    is_spawning = false; 
    spawn_finished = true;
}