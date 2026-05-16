// 1. Verifica se ainda há inimigos para nascer nesta wave
if (enemies_to_spawn > 0) {
    // Cria a instância do inimigo
    var _inst = instance_create_depth(-100, -100, get_layer_depth(LAYER.enemy), obj_Enemy);
    
    // 2. LÓGICA DE BALANCEAMENTO (Sinais e HP)
    var _hp_base = 3; // Valor base (positivo)
    var _multiplicador = ceil(global.wave / 3); // Aumenta a magnitude a cada 3 waves
    
    var _hp_final = 0;

    // REGRA: Até a Wave 3, apenas POSITIVOS (Para usar a Subtratora)
    if (global.wave <= 3) {
        _hp_final = _hp_base * _multiplicador;
    } 
    // REGRA: Após a Wave 3, mistura POSITIVOS e NEGATIVOS
    else {
        // Escolhe aleatoriamente o tipo (50% de chance para cada)
        if (choose(0, 1) == 0) {
            _hp_final = _hp_base * _multiplicador;  // Positivo
        } else {
            _hp_final = -_hp_base * _multiplicador; // Negativo
        }
    }
    
    // 3. Aplica os valores ao objeto recém-criado
    _inst.hit_points = _hp_final;
    _inst.hit_points_max = _hp_final;
    
    // Chama a função do inimigo para atualizar o frame do sprite e o sinal "-"
    with(_inst) {
        change_num();
    }

    // 4. CONTROLE DO FLUXO (O "Clock")
    enemies_to_spawn -= 1;
    
    // Reagenda este mesmo alarme para soltar o PRÓXIMO balão
    // O delay diminui conforme a wave aumenta, ficando mais rápido
    var _current_delay = max(15, 60 - (global.wave * 2)); 
    alarm[1] = _current_delay; 

} else {
    // Se todos os inimigos da horda já nasceram, agenda a PRÓXIMA WAVE (Alarm 0)
    // Espera 5 segundos entre uma wave e outra
    alarm[0] = game_get_speed(gamespeed_fps) * 5;
    show_debug_message("Horda finalizada. Aguardando próxima wave...");
}