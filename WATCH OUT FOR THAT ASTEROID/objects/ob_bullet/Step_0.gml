/// move
x += spd_x;
y += spd_y;

// move to asteroid if a collision will happen
var oasteroid = instance_place(x + spd_x, y + spd_y, ob_asteroid_lg);
if (oasteroid == noone)
{
	oasteroid = instance_place(x + spd_x, y + spd_y, ob_asteroid_md);
}
if (oasteroid == noone)
{
	oasteroid = instance_place(x + spd_x, y + spd_y, ob_asteroid_sm);
}

var safety = 0;
// check in increments of 10
for (var i = 0.1; i <= 1; i+=0.1)
{
	if place_meeting(x + spd_x*i, y + spd_y*i, oasteroid)
	{
		while (!place_meeting(x + spd_x, y + spd_y, oasteroid) && saftey < 128)
		{
			x += 0.1*spd_x;
			y += 0.1*spd_y;
			safety += 1;
		}
	}
}
