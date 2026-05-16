draw_set_alpha(1);
draw_set_color(c_white);
draw_self();

// Configura fonte e alinhamento
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white); // Cor do texto para contraste

draw_text(
	bbox_left + 16,
	bbox_top + 16,
	"Tower: " + string(tower_name) + " (Level: " + string(tower_level) + ")"
);

draw_text(
	bbox_left + 16,
	bbox_top + 46,
	"Current Damage: " + string(tower_damage)
);

draw_text(
	bbox_left + 16,
	bbox_top + 76,
	"Upgrade Cost: " + string(tower_update_cost)
);

// Resetar para não afetar outros draws
draw_set_color(c_white);