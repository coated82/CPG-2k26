//checar preço
if(global.cash_amount < cost) {
	return;
}

global.cash_amount -= cost;

with(obj_Placeable){
		can_be_seen = true;
}

//Fechar loja
parent.hide();

//attach mouse
obj_Mouse.selected_sprite = image;