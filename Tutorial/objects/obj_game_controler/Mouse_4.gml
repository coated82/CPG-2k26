// --- CANCELAR COMPRA AO CLICAR FORA ---

if (global.instance_tower_to_build != noone) {
    // Verificamos se o clique NÃO ocorreu em cima de um Placeable
    // E também verificamos se NÃO ocorreu em cima de um ícone da loja (opcional, para evitar conflitos)
    if (!position_meeting(mouse_x, mouse_y, obj_Placeable) && !position_meeting(mouse_x, mouse_y, obj_UI_Tower_Parent)) {
        
        // 1. Reseta a torre que seria construída
        global.instance_tower_to_build = noone;
        
        // 2. Limpa o "fantasma" do mouse
        obj_Mouse.selected_sprite = noone;
        
        // 3. Esconde os slots de construção
        with(obj_Placeable) {
            can_be_seen = false;
        }
        
        show_debug_message("Construção cancelada: Clique fora de um slot.");
    }
}