if (hp <= 0) {
    global.cash_amount += 5; // Recompensa por destruir
	global.gain_cash += 5;
    instance_destroy();
}