randomize();

hit_points = clamp(irandom_range(1, global.wave), 1, global.wave + 1);
hit_points_max = hit_points;

current_path = choose(pth_Top, pth_Bottom);

speed_current = random_range(0.5, random_range(1, (global.wave / 2)));

image_speed = 0;
image_index = irandom_range(0, 3);

path_start(
	current_path,
	speed_current,
	path_action_stop,
	true
);