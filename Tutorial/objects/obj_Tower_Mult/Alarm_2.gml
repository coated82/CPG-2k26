// Evento de geração de dinheiro (ex: Alarm 1)

// MULTIPLICADOR: O valor base (10) vezes o nível da torre
var _ganho_atual = 15 * level; 

global.cash_amount += _ganho_atual;

// Feedback visual (Importante para você ver que mudou!)
var _pop = instance_create_depth(x, y - 32, depth - 100, obj_FloatText);
_pop.text = "+$" + string(_ganho_atual);

// Reinicia o clock do dinheiro
alarm[1] = rate_of_fire;