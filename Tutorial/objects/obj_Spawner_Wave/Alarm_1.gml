/*
// 1. Verifica se ainda há inimigos para nascer nesta wave
if (enemies_to_spawn > 0) {
    // Cria a instância do inimigo (usando sua função de profundidade)
    var _inst = instance_create_depth(-100, -100, get_layer_depth(LAYER.enemy), obj_Enemy);
    
    // 2. LÓGICA DE BALANCEAMENTO
    var _hp_base = 3; 
    var _multiplicador = ceil(global.wave / 3); 
    var _hp_final = 0;
    var _is_imaginary = false; // Por padrão, nasce real

    // --- SELETOR DE TIPO (CORRIGIDO) ---
    
    // FASE 1: Introdução (Wave 1 até 5) - Apenas POSITIVOS
    if (global.wave <= 5) {
        _hp_final = _hp_base * _multiplicador;
    } 
    // FASE 2: Médio Prazo (Wave 6 até 14) - Mistura POSITIVOS e NEGATIVOS
    else if (global.wave < 15) { 
        // 50% de chance para cada sinal real
        if (choose(0, 1) == 0) {
            _hp_final = _hp_base * _multiplicador;  // Positivo
        } else {
            _hp_final = -_hp_base * _multiplicador; // Negativo
        }
    }
    // FASE 3: Avançado (Wave 15 em diante) - Introduz IMAGINÁRIOS
    else {
        var _sorteio = irandom(2); // Sorteia entre 0, 1 e 2
        
        if (_sorteio == 0) {
            _hp_final = _hp_base * _multiplicador;  // Positivo
        } else if (_sorteio == 1) {
            _hp_final = -_hp_base * _multiplicador; // Negativo
        } else {
            // IMAGINÁRIO! Aqui a Torre Exp entra em jogo
            _hp_final = _hp_base * _multiplicador; 
            _is_imaginary = true;
        }
    }
    
    // 3. Aplica os valores ao objeto recém-criado
    // Injetamos as variáveis antes de rodar o change_num
    _inst.hit_points = _hp_final;
    _inst.hit_points_max = _hp_final;
    _inst.is_imaginary = _is_imaginary; 
    
    // Sincroniza a "ALU" visual do inimigo (Frames e Sinais)
    with(_inst) {
        change_num();
    }

    // 4. CONTROLE DO FLUXO (O "Clock")
    enemies_to_spawn -= 1;
    
    // O intervalo entre spawns diminui com o tempo (mínimo de 15 frames)
    var _current_delay = max(15, 60 - (global.wave * 2)); 
    alarm[1] = _current_delay; 

} else {
    // Se a horda acabou, prepara a próxima Wave no Alarme 0
    alarm[0] = game_get_speed(gamespeed_fps) * 5;
    show_debug_message("Horda finalizada. Wave " + string(global.wave) + " completa.");
}
*/

//==================================
// --- ALARME 1: Spawner de Inimigos (VERSÃO DE TESTE RÁPIDO) ---

if (enemies_to_spawn > 0) {
    var _inst = instance_create_depth(-100, -100, get_layer_depth(LAYER.enemy), obj_Enemy);
    
    var _hp_base = 3; 
    var _multiplicador = ceil(global.wave / 3); 
    var _hp_final = 0;
    var _is_imaginary = false;

    // --- SELETOR DE TIPO ACELERADO PARA TESTE ---
    
    // FASE 1: Introdução (Wave 1 e 2) - Apenas POSITIVOS
    if (global.wave <= 2) {
        _hp_final = _hp_base * _multiplicador;
    } 
    // FASE 2: Transição (Wave 3 e 4) - Mistura POSITIVOS e NEGATIVOS
    else if (global.wave < 5) { 
        if (choose(0, 1) == 0) {
            _hp_final = _hp_base * _multiplicador;
        } else {
            _hp_final = -_hp_base * _multiplicador;
        }
    }
    // FASE 3: Teste de Imaginários (Wave 5 em diante)
    else {
        var _sorteio = irandom(2); 
        
        if (_sorteio == 0) {
            _hp_final = _hp_base * _multiplicador;
        } else if (_sorteio == 1) {
            _hp_final = -_hp_base * _multiplicador;
        } else {
            // IMAGINÁRIO ATIVADO!
            _hp_final = _hp_base * _multiplicador; 
            _is_imaginary = true;
        }
    }
    
    // Injeção de Dados
    _inst.hit_points = _hp_final;
    _inst.hit_points_max = _hp_final;
    _inst.is_imaginary = _is_imaginary; 
    
    with(_inst) {
        change_num();
    }

    // Controle do Fluxo
    enemies_to_spawn -= 1;
    var _current_delay = max(15, 60 - (global.wave * 2)); 
    alarm[1] = _current_delay; 

} else {
    alarm[0] = game_get_speed(gamespeed_fps) * 5;
}