if (global.pausado) exit;

if (instance_exists(parent_obj))
{
    // 1. ATUALIZAR POSIÇÃO
    // Usamos o image_angle do pai para manter o "i" orbitando ou posicionado corretamente
    x = parent_obj.x + lengthdir_x(offset_x, parent_obj.image_angle) + 10;
    y = parent_obj.y + lengthdir_y(offset_x, parent_obj.image_angle);

    // 2. ATUALIZAR ROTAÇÃO
    image_angle = parent_obj.image_angle;

    // 3. ATUALIZAR PROFUNDIDADE (O Pulo do Gato)
    // Forçamos o 'i' a ficar sempre à frente do seu pai
    depth = parent_obj.depth - 10;
}
else
{
    // Se o inimigo sumir, o indicador some junto
    instance_destroy();
}