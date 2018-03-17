/// prt_poof( x, y, len, dir)
// poofs at x, y

var xx = argument0;
var yy = argument1;
var len = argument2;
var dir = argument3;

var poof;
poof = instance_create(xx,yy,prt_puff);

with (poof)
{
    spd_x = lengthdir_x(len,dir);
    spd_y = lengthdir_y(len,dir);
}

return poof;
