// ============================================================================
//                          SELEÇÃO DE FASES
// ============================================================================

// Lista das fases
mapas = [
    { nome: "Paralelo",  room: rm_MainGame,  sprite: spr_fase_parelelo,  liberado: true,  x: 0, y: 0, w: 0, h: 0 },
    { nome: "Quadratico",   room: rm_MainGame_2,        sprite: spr_fase_quadratico_ofc,     liberado: true, x: 0, y: 0, w: 0, h: 0 },
    { nome: "Euler",     room: rm_MainGame_1,        sprite: spr_fase_euler_ofc,     liberado: true, x: 0, y: 0, w: 0, h: 0 }
];

indice_selecionado = 0;
tempo_anim = 0;