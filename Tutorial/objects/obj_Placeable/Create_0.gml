image_speed = 0;
image_index = 0; // Garante que comece no frame 0

is_being_hover = false;
can_be_seen = false;
is_occupied = false; // Nova variável: evita colocar duas torres no mesmo slot

// EMPURRA PARA TRÁS: 
// Aumentar o depth joga o objeto para o fundo do cenário.
// Se o seu jogo usa depth 0 para torres, 100 colocará o slot atrás delas.
depth = 100;