///grid_type(x,y)
// Returns the block type of the pixel from the parameters

var xx = argument[0];
var yy = argument[1];

if (xx > 0 && xx < room_width && yy > 0 && yy < room_height)
{
    return global.room_grid[# xx div T, yy div T];
}
else return -1;
