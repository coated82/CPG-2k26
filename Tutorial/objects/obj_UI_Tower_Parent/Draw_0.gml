draw_self();

set_align(fa_center, fa_middle);

//NOME
draw_text(x, y + 24, name);

//CUSTO
draw_text(x, y + 38, "Valor: " + string(cost));