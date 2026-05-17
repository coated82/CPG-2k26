// 1. Verificar se o spawn já terminou (is_spawning é falso) E se a tela está limpa
var _enemies_remaining = instance_number(obj_Enemy);

if (!is_spawning && enemies_to_spawn == 0 && _enemies_remaining == 0) {
    
    // 2. Se o alarme 0 não estiver rodando, ativa o descanso para a próxima wave
    if (alarm[0] <= 0) {
        show_debug_message("Wave Limpa! Próxima em instantes...");
        alarm[0] = timer_next_wave; 
    }
}