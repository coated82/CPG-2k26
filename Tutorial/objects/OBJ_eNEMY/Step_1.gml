if (dying)
{
    var t = 1 - (image_index / (image_number - 1));

    image_xscale = base_xscale * t;
    image_yscale = base_yscale * t;

    if (image_index >= image_number - 1)
    {
		instance_destroy();
    }
}