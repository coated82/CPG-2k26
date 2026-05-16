// 1. Calcula o ganho baseado no nível atual
var _ganho_final = cash_per_pulse * level; 

// 2. Adiciona ao dinheiro global
global.cash_amount += _ganho_final;

// 3. AUTO-RELOAD (O "Loop" do Alarme)
alarm[1] = rate_of_fire;

// 4. Debug no console (Verifique a janela "Output" no GameMaker para ver isso)
show_debug_message("DINHEIRO GERADO: $" + string(_ganho_final) + " (Nível: " + string(level) + ")");