// ============================================================================
//                          SELEÇÃO DE FASES
// ============================================================================

// Lista das fases
mapas = [
    { nome: "Paralelo",  room: rm_MainGame,  sprite: spr_fase_parelelo,  liberado: true,  x: 0, y: 0, w: 0, h: 0 },
    { nome: "Quadratico",   room: noone,        sprite: spr_fase_quadratico,     liberado: true, x: 0, y: 0, w: 0, h: 0 },
    { nome: "Euler",     room: noone,        sprite: spr_fase_euler,     liberado: true, x: 0, y: 0, w: 0, h: 0 }
];

indice_selecionado = 0;
tempo_anim = 0;