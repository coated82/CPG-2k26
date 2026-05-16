//==================================
// --- ALARME 1: Spawner de Inimigos (VERSÃO BOOLEANA FINAL) ---
if (enemies_to_spawn > 0) {
    // 1. CRIAÇÃO (Usando seu sistema de camadas)
    var _inst = instance_create_depth(-100, -100, get_layer_depth(LAYER.enemy), obj_Enemy);
    
    // 2. VARIÁVEIS DE CÁLCULO
    var _hp_base = 3; 
    var _multiplicador = ceil(global.wave / 3); 
    var _hp_final = _hp_base * _multiplicador; 
    
    var _is_negative = false;   
    var _is_imaginary = false;  

    // --- SELETOR DE TIPO (Sua lógica de fases excelente) ---
    
    if (global.wave <= 2) {
        _is_negative = false;
    } 
    else if (global.wave < 5) { 
        if (choose(0, 1) == 0) {
            _is_negative = false; 
        } else {
            _is_negative = true;  
        }
    }
    else {
        var _sorteio = irandom(2); 
        if (_sorteio == 0) {
            _is_negative = false; 
        } else if (_sorteio == 1) {
            _is_negative = true;  
        } else {
            // Lógica Imaginária: vira negativo quando "curado"
            _is_negative = true; 
            _is_imaginary = true;
        }
    }
    
    // 3. INJEÇÃO DE DADOS (Aqui garantimos a sincronia)
    _inst.hit_points = _hp_final;      
    _inst.is_negative = _is_negative;  
    _inst.is_imaginary = _is_imaginary; 
    
    // Chamamos o change_num para atualizar os sinais assim que nasce
    with(_inst) {
        change_num();
    }

    // 4. CONTROLE DO FLUXO
    enemies_to_spawn -= 1;
    var _current_delay = max(15, 60 - (global.wave * 2)); 
    alarm[1] = _current_delay; 

} else {
    // 5. PRÓXIMA WAVE
    alarm[0] = game_get_speed(gamespeed_fps) * 5;
}