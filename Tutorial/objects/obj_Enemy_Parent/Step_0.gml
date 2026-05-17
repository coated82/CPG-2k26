if (hp <= 0) {
    global.cash_amount += 5; // Recompensa por destruir
    instance_destroy();
}