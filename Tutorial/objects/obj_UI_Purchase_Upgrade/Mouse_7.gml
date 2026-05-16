if(global.selected_tower != noone) {
	if(global.cash_amount >= global.selected_tower.upgrade_price) {
		global.cash_amount -= global.selected_tower.upgrade_price;
		
		global.selected_tower.upgrade();
		
		tower_select(global.selected_tower);
	}
}