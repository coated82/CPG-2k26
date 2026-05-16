draw_self();

var amount = (hit_points / hit_points_max) * 100;
var sprite_half = sprite_width / 2;

draw_healthbar(
	x - sprite_half,
	y + 32,
	x + sprite_half,
	y + 34,
	amount,
	c_black,
	c_red,
	c_lime,
	0,
	true,
	false
	);