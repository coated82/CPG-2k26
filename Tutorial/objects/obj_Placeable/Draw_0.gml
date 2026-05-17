

// REGRA DE OURO: Só mostramos os slots se o jogador estiver com uma torre selecionada
// Isso limpa o visual do seu mapa automaticamente.
if (global.instance_tower_to_build != noone) {
    draw_self();
    
    // Pequeno feedback: se o mouse estiver em cima, brilha um pouco
    if (position_meeting(mouse_x, mouse_y, id)) {
        draw_set_alpha(0.3);
        draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(1.0);
    }
} else {
    // Se não tem torre na mão, can_be_seen volta a ser falso para garantir
    can_be_seen = false;
}