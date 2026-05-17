if (global.pausado) exit;

if (instance_exists(parent_obj))
{
    var ang = degtorad(parent_obj.image_angle);

    x = parent_obj.x + lengthdir_x(offset_x, parent_obj.image_angle);
    y = parent_obj.y + lengthdir_y(offset_x, parent_obj.image_angle);

    image_angle = parent_obj.image_angle;
}
else
{
    instance_destroy();
}