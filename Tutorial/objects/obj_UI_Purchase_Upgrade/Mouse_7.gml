var _panel = parent; 

if (instance_exists(_panel) && instance_exists(_panel.selected_tower)) {
    var _tower = _panel.selected_tower;
    
    // Chama o seu script passando a torre selecionada
    tower_upgrade(_tower);
    
    // Efeito de clique no botão (feedback para o jogador)
    image_xscale = 1.2;
    image_yscale = 1.2;
}