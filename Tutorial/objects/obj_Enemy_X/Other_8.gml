if (global.pausado) exit;

// 1. Decrementa o contador de vidas global
// Sendo um Boss, você pode até fazer ele tirar mais vidas (ex: -= 5), 
// mas vamos deixar 1 por enquanto para testar.
global.hitpoints -= 10;

// 2. Verificação de Game Over
if (global.hitpoints <= 0) {
    room_goto(rm_final_scream);
}

// 3. Destruição Limpas
//mudando
// O Boss X não tem sinais para limpar, então apenas nos destruímos!
instance_destroy();