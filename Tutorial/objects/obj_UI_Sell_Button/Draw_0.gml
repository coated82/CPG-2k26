if (!instance_exists(parent)) exit;
if (!parent.visible) exit;

// 1. Força o botão a seguir o painel e ficar na frente (depth menor = mais perto da tela)
x = parent.x; 
y = parent.y;
depth = parent.depth - 100; // Valor bem baixo para garantir que está na frente

// 2. Desenha o botão (mesmo código que já tínhamos)
draw_set_color(c_maroon);
draw_rectangle(x - 70, y - 25, x + 70, y + 25, false);
draw_set_color(c_white);
draw_rectangle(x - 70, y - 25, x + 70, y + 25, true);

// 3. Texto do valor
if (instance_exists(parent.selected_tower)) {
    var _val = floor(parent.selected_tower.total_invested * 0.6);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(x, y, "VENDER\n$" + string(_val));
}