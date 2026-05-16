if(global.instance_tower_to_build != noone) {
//create instance tower
instance_create_depth(
	x,
	y,
	get_layer_depth(LAYER.towers),
	global.instance_tower_to_build
);


//Limpar global
global.instance_tower_to_build = noone;

//Clear mouse
obj_Mouse.selected_sprite = noone;

//Remove select Placeable
instance_destroy();

//Hide rest of the placeables
with(obj_Placeable){
	can_be_seen = false;
}

	
}