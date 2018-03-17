/// asteroid_dust(x, y, n)
// creates an explosion of dust

var xx = argument0;
var yy = argument1;
var n  = argument2;

for (var i = 0; i < n; i++)
{
	var dust = instance_create_depth(xx,yy,depth,ob_dust);
	
	var rrot = random(360);
	var vel  = random_range(2,3);
	
	dust.spd_x = lengthdir_x(vel + random_range(-1,1), rrot);
	dust.spd_y = lengthdir_y(vel + random_range(-1,1), rrot);
}
