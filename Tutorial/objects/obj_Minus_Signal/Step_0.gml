if (global.pausado) exit;

if (instance_exists(parent_obj))
{
    // 1. ATUALIZAR POSIÇÃO
    // Note que removi o 'var ang' pois o lengthdir já converte os graus internamente
    x = parent_obj.x + lengthdir_x(offset_x, parent_obj.image_angle);
    y = parent_obj.y + lengthdir_y(offset_x, parent_obj.image_angle);

    // 2. ATUALIZAR ROTAÇÃO
    image_angle = parent_obj.image_angle;

    // 3. PRIORIDADE VISUAL (Depth)
    // Usamos um valor um pouco diferente do 'i' para evitar conflito (Z-fighting)
    // Se o 'i' está no -10, o menos pode ficar no -11
    depth = parent_obj.depth - 11;
}
else
{
    // Limpeza de sistema: se o inimigo sumir, o sinal também some
    instance_destroy();
}