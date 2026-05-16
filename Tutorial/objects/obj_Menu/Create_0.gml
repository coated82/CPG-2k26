// ========== CONFIGURAÇÕES DO MENU ==========
menu = [
    { texto: "Jogar", funcao: function() { room_goto(rm_MainGame); } },
    { texto: "Opções", funcao: function() { room_goto(rm_opcoes); } },
    { texto: "Comandos", funcao: function() { room_goto(rm_comandos); } },
    { texto: "Sair", funcao: function() { game_end(); } }
];

atual = 0;           // Índice selecionado
margem = 0;          // Efeito de deslize
tempo_menu = 0;      // Para animações

// ========== POSIÇÕES DO MENU ==========
menu_x = 200;         // Posição X do menu
menu_y_base = 220;   // Posição Y base
altura_linha = 50;   // Altura de cada opção (ajuste conforme sua fonte)

// Remove essa linha problemática:
// display_set_gui_size(window_get_width(), window_get_height());