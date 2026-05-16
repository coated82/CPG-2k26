if (global.pausado) exit;

// 1. Decrementa o contador de vidas global
global.hitpoints -= 1;

// 2. Verificação de Condição de Parada (Game Over)
if (global.hitpoints <= 0) {
    game_restart(); // Reinicia o sistema
}

// 3. Limpeza de memória (SINAIS ÓRFÃOS)
// Usando os nomes novos das variáveis de instância
if (instance_exists(inst_minus_signal)) {
    instance_destroy(inst_minus_signal);
}

if (instance_exists(inst_imaginary_signal)) {
    instance_destroy(inst_imaginary_signal);
}

// 4. Remove a instância para liberar o "slot"
instance_destroy();