// ============================================================================
//                          SELEÇÃO DE FASES
// ============================================================================

// Lista das fases
mapas = [
    { nome: "Paralelo",  room: rm_MainGame,  sprite: spr_fase_parelelo,  liberado: true,  x: 0, y: 0, w: 0, h: 0 },
    { nome: "???",       room: noone,        sprite: spr_fase_locked_1,     liberado: true, x: 0, y: 0, w: 0, h: 0 },
    { nome: "???",       room: noone,        sprite: spt_fase_locked_2,     liberado: true, x: 0, y: 0, w: 0, h: 0 },
    //{ nome: "???",       room: noone,        sprite: spr_fase_locked,     liberado: false, x: 0, y: 0, w: 0, h: 0 },
    //{ nome: "???",       room: noone,        sprite: spr_fase_locked,     liberado: false, x: 0, y: 0, w: 0, h: 0 }
];

indice_selecionado = 0;
tempo_anim = 0;