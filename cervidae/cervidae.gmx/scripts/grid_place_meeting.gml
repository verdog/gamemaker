///grid_place_meeting(x,y)

var xx = argument[0];
var yy = argument[1];

//remember
var xp = x;
var yp = y;

//update for calculations
x = round(xx);
y = round(yy);
         
var meeting = false;

// Solid

if (bbox_right >= 0 && bbox_right < room_width && bbox_top >= 0 && bbox_top < room_height)
    meeting = meeting | (global.room_grid[# bbox_right div T, bbox_top div T] >= 0);

if (bbox_left >= 0 && bbox_left < room_width && bbox_top >= 0 && bbox_top < room_height)
    meeting = meeting | (global.room_grid[# bbox_left div T, bbox_top div T] >= 0);

if (bbox_right >= 0 && bbox_right < room_width && bbox_bottom >= 0 && bbox_bottom < room_height)
    meeting = meeting | (global.room_grid[# bbox_right div T, bbox_bottom div T] >= 0);

if (bbox_left >= 0 && bbox_left < room_width && bbox_bottom >= 0 && bbox_bottom < room_height)
    meeting = meeting | (global.room_grid[# bbox_left div T, bbox_bottom div T] >= 0);

//move back
x = xp;
y = yp;

return meeting;
