if(global.instance_tower_to_build != noone) {
    
    // 1. CALCULAR O CENTRO
    // Se seu grid original é 32x32, e o placeable agora é 2x2 (64x64),
    // o centro está a 32 pixels de distância do canto.
    var _offset = 32; 

    // 2. CRIAR A TORRE NO CENTRO
    instance_create_depth(
        x + _offset, // Move para a direita até o centro
        y + _offset, // Move para baixo até o centro
        get_layer_depth(LAYER.towers),
        global.instance_tower_to_build
    );

    // O resto do código continua igual...
    global.instance_tower_to_build = noone;
    obj_Mouse.selected_sprite = noone;
    instance_destroy();

    with(obj_Placeable){
        can_be_seen = false;
    }
}