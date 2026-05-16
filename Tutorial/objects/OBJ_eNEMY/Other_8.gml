if (global.pausado) exit;

// 1. Decrementa o contador de vidas global
global.hitpoints -= 1;


// 3. Verificação de Condição de Parada (Game Over)
if (global.hitpoints <= 0) {
    game_restart(); // Reinicia o sistema
}

// 4. Limpeza de memória antes da destruição
if (instance_exists(minus)) {
    instance_destroy(minus);
}

// 5. Remove a instância para liberar o "slot"
instance_destroy();