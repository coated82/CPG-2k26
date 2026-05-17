// 1. Pega a referência da torre através do painel pai
// Usamos 'parent' porque o botão é um objeto filho dentro do objeto Painel
var _panel = parent; 

if (instance_exists(_panel) && instance_exists(_panel.selected_tower)) {
    var _tower = _panel.selected_tower;
    
    // 2. Verificação de Pré-Requisitos
    // Só prosseguimos se o jogador tiver dinheiro E a torre não estiver no nível máximo
    if (global.cash_amount >= _tower.upgrade_cost && _tower.level < _tower.max_level) {
        
        // 3. Executa a lógica global de upgrade (Status e Cobrança)
        tower_upgrade(_tower);
        

        
        // Dica: No evento Step do botão, você pode usar um lerp para voltar a escala para 1.0
        // image_xscale = lerp(image_xscale, 1, 0.1);
    } else {
        // Feedback sonoro ou visual de "Sem Dinheiro" pode ser adicionado aqui
        show_debug_message("Upgrade falhou: Recursos insuficientes ou nível máximo.");
    }
}