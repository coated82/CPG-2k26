// 1. Incrementa o saldo global correto
global.cash_amount += money_generation;

// 2. Cria o efeito visual (que já criaste no passo anterior)
instance_create_depth(x, y - 32, depth - 100, obj_Effect_MoneyText);

// 3. REARMA O TIMER (Crucial para o loop continuar)
alarm[2] = rate_of_fire;