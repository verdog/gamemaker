/// init

x = random(room_width);
y = random(room_height);

var safety = 0;
while ( safety < 8 &&
		place_meeting(x,y,ob_asteroid_lg) ||
		place_meeting(x,y,ob_asteroid_md) ||
		place_meeting(x,y,ob_asteroid_sm)
	  )
{
	x = random(room_width );
	y = random(room_height);
	safety++;
}

dir = random(360);
rspd = random_range(1,1.5);

spd_x = lengthdir_x(rspd, dir);
spd_y = lengthdir_y(rspd, dir);

spd_rot = random(3); // deg/sec
rot = 0;

image_speed = 0;
image_index = irandom_range(1,3);