// 1. Tenta encontrar a torre no clique
var _inst = collision_point(mouse_x, mouse_y, obj_Tower_Parent, true, false);

if (_inst != noone) {
    // SELECIONA A TORRE
    global.selected_tower = _inst;
    
    // FAZ O MENU SUBIR
    // Se o seu sistema de menu usa a função tower_select, chame-a aqui:
    tower_select(_inst); 
    
    // Caso o menu suba por uma variável de estado, mude-a aqui. Ex:
    // global.menu_active = true;
} else {
    // CLIQUE NO VAZIO: Limpa tudo
    global.selected_tower = noone;
    
    // COMANDO PARA O MENU DESCER (Ajuste conforme seu código de menu)
    // tower_deselect(); 
    
}