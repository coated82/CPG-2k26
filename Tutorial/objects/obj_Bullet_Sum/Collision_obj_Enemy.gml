// No evento Collision com obj_Enemy
with(other) {
    // OPERAÇÃO DE SOMA
    valor += other._damage; 
    
    // Se o inimigo era -5 e somamos 5, ele vira 0 e morre
    if (valor >= 0) {
        instance_destroy();
        global.money += 10; // Recompensa
    }
}
instance_destroy(); // Destrói a bala