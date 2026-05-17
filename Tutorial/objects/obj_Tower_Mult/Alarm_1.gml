//================================================================
// ALARME 1 - LÓGICA DE GERAÇÃO DE DINHEIRO (OBJ_TOWER_MULT)
//================================================================

// 1. GARANTIA DE VALOR BASE (Watchdog de Monitoria)
if (!variable_instance_exists(id, "cash_per_pulse") || cash_per_pulse <= 0) {
    cash_per_pulse = 15;
}

// 2. CÁLCULO DO LUCRO REAL
// Se level for 0, multiplicador é 1. Se level for 1, multiplicador é 2...
var _multiplicador_final = level + 1; 
var _lucro_real = cash_per_pulse * _multiplicador_final;

// 3. ATUALIZAÇÃO DO CAIXA GLOBAL
global.cash_amount += _lucro_real;

// 4. FEEDBACK VISUAL (Texto Flutuante corrigido)
if (asset_get_index("obj_FloatText") != -1) {
    // Criamos a instância e armazenamos a ID única dela em _inst_text
    var _inst_text = instance_create_depth(x, y - 32, depth - 100, obj_FloatText);
    
    // ESCRIÇÃO DIRETA: Forçamos a variável 'text' do objeto criado a receber o valor
    // Isso evita que ele mostre +0 por erro de timing ou leitura de variável errada
    if (instance_exists(_inst_text)) {
        _inst_text.text = "+$" + string(floor(_lucro_real));
    }
}

// 5. REINICIA O CICLO E O FRAME VISUAL
image_index = level; 
alarm[1] = fire_rate;

// Log para acompanhar no console (Debug)
show_debug_message(">>> MULTIPLICADORA: Gerado $" + string(_lucro_real) + " (Level " + string(level) + ")");