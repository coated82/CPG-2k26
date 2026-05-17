//==================================
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