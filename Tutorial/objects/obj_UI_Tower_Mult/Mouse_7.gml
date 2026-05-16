// Herda o movimento/visibilidade do pai da UI
event_inherited();

// Seleciona o objeto REAL para construção (o que atira e não tem HUD)
global.instance_tower_to_build = obj_Tower_Mult;

// Esconde o painel após selecionar
if (instance_exists(parent)) {
    parent.hide();
}
