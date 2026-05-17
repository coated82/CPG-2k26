global.tooltip_text = "";
// 1. Define a profundidade base para a UI (o mais para frente possível)
var _base_depth = -15000;

// 2. Cria a barra de status (Vida, Dinheiro, Wave)
// Usamos a profundidade base
instance_create_depth(0, 0, _base_depth, obj_UI_Bar);

// 3. Cria a Loja/Painel lateral
// Usamos _base_depth - 1 para garantir que a loja fique ACIMA da barra se elas se cruzarem
instance_create_depth(1312, 32, _base_depth - 1, obj_UI_Shop);

// 4. Opcional: Se este objeto for APENAS um "spawnador", ele pode sumir agora.
// Se este objeto for o Master que desenha coisas, NÃO use o instance_destroy.
instance_destroy();