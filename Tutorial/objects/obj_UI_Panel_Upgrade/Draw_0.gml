draw_self();

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Desenho dos textos sobre o painel
draw_text(bbox_left + 16, bbox_top + 16, "Torre: " + string(tower_name) + " (Lv: " + string(tower_level) + ")");
draw_text(bbox_left + 16, bbox_top + 46, "Dano: " + string(tower_damage));
draw_text(bbox_left + 16, bbox_top + 76, "Custo: " + string(tower_update_cost));