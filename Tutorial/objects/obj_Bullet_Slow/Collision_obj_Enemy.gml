// Evento de Colisão do obj_Bullet_Div com obj_Enemy_Parent
if (instance_exists(other)) {
    // Chama a função de lentidão do inimigo
    // slow_amount é o quanto reduz, 2 é a duração em segundos
    other.slow(slow_amount, 2); 
    
    instance_destroy();
}