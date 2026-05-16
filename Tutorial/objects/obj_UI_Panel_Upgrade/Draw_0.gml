draw_self();

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Desenho dos textos sobre o painel
draw_text(bbox_left + 16, bbox_top + 16, "Tower: " + string(tower_name) + " (Lv: " + string(tower_level) + ")");
draw_text(bbox_left + 16, bbox_top + 46, "Dmg: " + string(tower_damage));
draw_text(bbox_left + 16, bbox_top + 76, "Cost: " + string(tower_update_cost));