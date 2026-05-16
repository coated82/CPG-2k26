image_speed = 0;

name = "default";
level = 1;

upgrade_price = 10;
bullet_damage = 1;

rate_of_fire = 0.2;
radius = 150;

offset_x = 0;
offset_y = 0;

can_shoot = true;
target = noone;
is_selected = false;

alarm_set(1, 1);

upgrade = function(){
	level += 1;
	bullet_damage = bullet_damage * 2;
	upgrade_price = upgrade_price + (upgrade_price / 5);
	radius = radius + (radius / 10);
}