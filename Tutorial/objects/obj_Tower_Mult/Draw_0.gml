// Inherit the parent event
event_inherited();

draw_self(); // Desenha o sprite da torre

draw_set_color(c_yellow);
draw_set_halign(fa_center);

// Mostra o nível e quanto ela vai gerar no próximo pulo
draw_text(x, y - 40, "LVL: " + string(level));
draw_text(x, y - 55, "+$" + string(cash_per_pulse * level));

draw_set_halign(fa_left); // Reseta o alinhamento
draw_set_color(c_white);