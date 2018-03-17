/// bullet hit

if (place_meeting(x,y,ob_bullet))
{
	var bullet = instance_place(x,y,ob_bullet);
	
	//split
	if (next_asteroid != noone)
	{
		var firsthalf = instance_create_depth(x,y,depth,next_asteroid);
		var secondhalf = instance_create_depth(x,y,depth,next_asteroid);
		
		var mag  = sqrt(spd_x * spd_x + spd_y * spd_y);
		var deg  = 90 - arctan2(bullet.spd_y, bullet.spd_x) * 180/pi;
		var deg2 = deg + 180;
		
		firsthalf.x  = x+lengthdir_x( (firsthalf.sprite_width)/2,deg );
		firsthalf.y  = y+lengthdir_y((firsthalf.sprite_height)/2,deg );
		secondhalf.x = x+lengthdir_x( (firsthalf.sprite_width)/2,deg2);
		secondhalf.y = y+lengthdir_y((firsthalf.sprite_height)/2,deg2);
		
		firsthalf.spd_x  = lengthdir_x(mag*1.50, deg);
		firsthalf.spd_y  = lengthdir_y(mag*1.50, deg);
		
		secondhalf.spd_x = lengthdir_x(mag*1.50, deg2);
		secondhalf.spd_y = lengthdir_y(mag*1.50, deg2);
		
		instance_destroy();
	}
	else
	{
		instance_destroy();
	}
	
	asteroid_dust(x,y,8);
	instance_destroy(bullet);	
}

// check if all asteroids are gone
if ( !instance_exists(ob_asteroid_lg) && 
	 !instance_exists(ob_asteroid_md) && 
	 !instance_exists(ob_asteroid_sm) &&
	 ob_levelcontrol.alarm[1] == -1
   )
{
	ob_levelcontrol.alarm[1] = 90;
}