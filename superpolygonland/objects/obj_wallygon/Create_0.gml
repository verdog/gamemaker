/// init

sprite_index = noone;

points_x = ds_list_create();
points_y = ds_list_create();

sides = irandom_range(3,5);

angleplus = 360/sides;
angle = random(360);
size = irandom_range(32, 128);

for (var i=0; i<sides; i++) {
	ds_list_add(points_x, x + lengthdir_x(size, angle));
	ds_list_add(points_y, y + lengthdir_y(size, angle));
	angle += angleplus;
}

depth = -50;