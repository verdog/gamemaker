/// prts_goo( x, y, len, dir)
// goos at x, y

var xx = argument0;
var yy = argument1;
var len = argument2;
var dir = argument3;

var poof;
poof = instance_create(xx,yy,prt_puff);

poof.sprite_index = spr_prt_goo;

with (poof)
{
    spd_x = lengthdir_x(len,dir);
    spd_y = lengthdir_y(len,dir);
    
    image_index = irandom(image_number - 1);
    image_speed = 1/(25 + irandom_range(-2,2));
    alarm[0] = irandom_range(45, 100);
}

return poof;
