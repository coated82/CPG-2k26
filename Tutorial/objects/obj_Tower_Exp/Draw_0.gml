// Inherit the parent event
event_inherited();

draw_self();

// Desenha o círculo de área de efeito (Fade out baseado no alarme)
var _alpha = alarm[0] / (0.5 * game_get_speed(gamespeed_fps));
draw_set_alpha(_alpha * 0.3);
draw_circle_color(x, y, radius, c_teal, c_blue, false);
draw_set_alpha(1.0);