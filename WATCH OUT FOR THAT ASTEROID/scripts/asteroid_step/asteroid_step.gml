/// move
x += spd_x;
y += spd_y;
rot += spd_rot;

// check for collision
var oasteroid = instance_place(x + spd_x, y + spd_y, ob_asteroid_lg);
if (oasteroid == noone)
{
	oasteroid = instance_place(x + spd_x, y + spd_y, ob_asteroid_md);
}
if (oasteroid == noone)
{
	oasteroid = instance_place(x + spd_x, y + spd_y, ob_asteroid_sm);
}

// asteroid bounces
if place_meeting(x + spd_x, y + spd_y, oasteroid)
{	
	var safety = 0;
	
	while(!place_meeting(x + sign(spd_x), y + sign(spd_y), ob_asteroid_lg) && safety < 128)
	{
		x += 0.1*(spd_x);
		y += 0.1*(spd_y);
		safety += 1;
	}
	
	var xv = abs(x-oasteroid.x);
	var yv = abs(y-oasteroid.y);
	var vector = abs(xv - yv);
	
	if (vector < 2)
	{
		// corner bounce
		spd_x = -spd_x;
		spd_y = -spd_y;
	}
	else
	{
		// surface bounce
		if (xv > yv)
		{
			// x bounce
			spd_x = -spd_x;	
		}
		else
		{
			// y bounce
			spd_y = -spd_y;
		}
	}
	
	// new spin
	spd_rot = random_range(0, 3);
	
	// dust
	asteroid_dust(x,y,4);
}

// stay inbounds
if (x - sprite_get_xoffset(sprite_index) < -sprite_width)
{
	x = room_width + sprite_width + sprite_get_xoffset(sprite_index);
}

if (x - sprite_get_xoffset(sprite_index) > room_width + sprite_width)
{
	x = -sprite_width + sprite_get_xoffset(sprite_index);
}

if (y - sprite_get_yoffset(sprite_index)  < -sprite_height)
{
	y = room_height + sprite_height + sprite_get_yoffset(sprite_index);	
}

if (y - sprite_get_yoffset(sprite_index) > room_height + sprite_height)
{
	y = -sprite_height + sprite_get_yoffset(sprite_index);
}

// player collision
if (place_meeting(x,y,ob_ship))
{
	var othr = instance_place(x,y,ob_ship);
	othr.alive = false;
	asteroid_dust(othr.x, othr.y, 25);
	with (othr) { instance_destroy(); }
	ob_levelcontrol.alarm[0] = 90;
}