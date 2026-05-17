/*/==================================
// --- ALARME 1: Spawner de Inimigos (EQUILIBRADO ATÉ WAVE 20) ---

if (enemies_to_spawn > 0) {
    var _inst = instance_create_depth(-100, -100, get_layer_depth(LAYER.enemy), obj_Enemy);
    
    // Velocidade muito suave para a média da Wave 20
    _inst.path_speed = 0.8 + (global.wave * 0.02); 
    
    var _hp_base = 2; 
    var _multiplicador = ceil(global.wave / 3); 
    var _hp_final = _hp_base * _multiplicador; 
    
    var _is_negative = false;   
    var _is_imaginary = false;   

    // Seletor de tipo (Mantido para manter a diversidade matemática)
    if (global.wave <= 2) {
        _is_negative = false;
    } 
    else if (global.wave < 5) { 
        if (choose(0, 1) == 0) _is_negative = false; 
        else _is_negative = true;  
    }
    else {
        var _sorteio = irandom(2); 
        if (_sorteio == 0) _is_negative = false; 
        else if (_sorteio == 1) _is_negative = true;  
        else {
            _is_negative = true; 
            _is_imaginary = true;
        }
    }
    
    _inst.hit_points = _hp_final;      
    _inst.is_negative = _is_negative;  
    _inst.is_imaginary = _is_imaginary; 
    
    with(_inst) { change_num(); }

    enemies_to_spawn -= 1;
    
    // Delay que garante espaçamento até o final
    var _current_delay = max(40, 80 - (global.wave * 1)); 
    alarm[1] = _current_delay; 

} else {
    is_spawning = false; 
    spawn_finished = true;
}
*/
//==================================
// --- ALARME 1: Spawner de Inimigos ---
//==================================

if (enemies_to_spawn > 0) {
    // 1. SELETOR DE OBJETO
    var _obj_to_spawn = obj_Enemy;
    
    // Regra do Boss (Wave 3)
    if (global.wave == 3 && enemies_to_spawn == 1) {
        _obj_to_spawn = obj_Enemy_X;
    }
    // Regra do Regenerador (Wave 12+)
    // Sorteia 20% de chance de vir um regenerador a cada spawn
    else if (global.wave >= 12) {
        if (irandom(100) <= 20) { 
            _obj_to_spawn = obj_Enemy_heal; 
        }
    }

    // 2. CRIAÇÃO DA INSTÂNCIA
    var _inst = instance_create_depth(x, y, get_layer_depth(LAYER.enemy), _obj_to_spawn);
    
    // 3. CÁLCULO DE ATRIBUTOS BASE
    var _hp_base = 2; 
    var _multiplicador = ceil(global.wave / 3); 
    var _hp_final = _hp_base * _multiplicador; 
    var _vel_final = 0.8 + (global.wave * 0.02);
    
    // Ajustes de Atributos por Tipo
    if (_obj_to_spawn == obj_Enemy_X) {
        _hp_final = 80;
        _vel_final = 0.4;
    }
    else if (_obj_to_spawn == obj_Enemy_heal) {
        // O Heal escala com a wave, mas sempre tem um pouco mais de HP que o comum
        _hp_final = (_hp_base * _multiplicador) + 2; 
        _vel_final = 1.0;
    }
    
    // 4. SELETOR MATEMÁTICO (Sinais)
    var _is_negative = false;   
    var _is_imaginary = false;   

    if (_obj_to_spawn == obj_Enemy_heal) {
        // Regeneradores são sempre Naturais (Positivos e Reais)
        _is_negative = false;
        _is_imaginary = false;
    } 
    else if (global.wave <= 2) {
        _is_negative = false;
    } 
    else if (global.wave < 5) { 
        if (choose(0, 1) == 1) _is_negative = true;  
    }
    else {
        var _sorteio = irandom(2); 
        if (_sorteio == 1) _is_negative = true;  
        else if (_sorteio == 2) {
            _is_negative = true; 
            _is_imaginary = true;
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
    var _current_delay = max(40, 80 - (global.wave * 1)); 
    alarm[1] = _current_delay; 

} else {
    is_spawning = false; 
    spawn_finished = true;
}