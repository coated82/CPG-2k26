// 1. Cálculo do lucro
var _ganho = cash_per_pulse * level;
global.cash_amount += _ganho;

// 2. Feedback Visual (Com trava de segurança)
// Verificamos se o recurso "obj_FloatText" realmente existe no Asset Browser
if (asset_get_index("obj_FloatText") != -1) {
    var _pop = instance_create_depth(x, y - 32, depth - 100, obj_FloatText);
    _pop.text = "+$" + string(_ganho);
} else {
    show_debug_message("Aviso: obj_FloatText nao encontrado no Asset Browser.");
}

// 3. Efeito Visual na própria torre
image_xscale = 0.25; 
image_yscale = 0.25;
image_blend = c_yellow;
alarm[2] = 10; 

// 4. Reinicia o ciclo
alarm[1] = fire_rate;