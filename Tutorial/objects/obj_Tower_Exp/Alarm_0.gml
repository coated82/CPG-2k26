var _me = id;

// 1. LÓGICA DE EXPLOSÃO (Dano/Efeito nos inimigos)
with (obj_Enemy) {
    if (point_distance(x, y, _me.x, _me.y) <= _me.radius) {
        if (is_imaginary) {
            is_imaginary = false;
            change_num(); 
            effect_create_above(ef_spark, x, y, 1, c_aqua);
        }
        // Se a bomba der dano real, você pode adicionar aqui:
        // hp -= _me.damage; 
    }
}

// 2. EFEITO VISUAL DA EXPLOSÃO
effect_create_above(ef_ring, x, y, 2, c_blue);

// 3. RESTAURAÇÃO DO MAPA (O QUE ESTAVA FALTANDO)
// Criamos o slot de volta no lugar onde a bomba estava
// Usamos as variáveis my_slot_x/y que injetamos no obj_Placeable
var _slot = instance_create_depth(my_slot_x, my_slot_y, 100, obj_Placeable);

if (instance_exists(_slot)) {
    _slot.image_xscale = 2.0; // Mantendo o padrão 2x2 do seu cenário
    _slot.image_yscale = 2.0;
    _slot.is_occupied = false;
}

// 4. LIMPEZA DE SEGURANÇA PARA A UI
if (global.selected_tower == id) {
    global.selected_tower = noone;
    if (instance_exists(obj_UI_Panel_Upgrade)) {
        obj_UI_Panel_Upgrade.hide();
    }
}

// 5. DESTRUIÇÃO DA BOMBA
instance_destroy();