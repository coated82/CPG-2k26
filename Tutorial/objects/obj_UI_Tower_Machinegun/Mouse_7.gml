// Herda o movimento/visibilidade do pai da UI
event_inherited();

// Seleciona o objeto REAL para construção (o que atira e não tem HUD)
global.instance_tower_to_build = obj_Tower_Machinegun;

// Esconde o painel após selecionar
if (instance_exists(parent)) {
    parent.hide();
}
<<<<<<< Updated upstream
=======

show_debug_message("Preparado para construir Torre de Metralhadora");
>>>>>>> Stashed changes
