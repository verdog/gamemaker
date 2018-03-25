/// draw_raycast_set_towards(x1, y1, x2, y2)

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

draw_set_color(c_green);

var length = round(2 * max(room_width, room_height));
var dir = point_direction(x1, y1, x2, y2);
length *= lineseg_getK_all(x1, y1, x1 + lengthdir_x(length, dir), y1 + lengthdir_y(length, dir));
draw_line(x1, y1, x1 + lengthdir_x(length, dir), y1 + lengthdir_y(length, dir));

var length = round(2 * max(room_width, room_height));
var dir = point_direction(x1, y1, x2, y2) - 0.001;
length *= lineseg_getK_all(x1, y1, x1 + lengthdir_x(length, dir), y1 + lengthdir_y(length, dir));
draw_line(x1, y1, x1 + lengthdir_x(length, dir), y1 + lengthdir_y(length, dir));

var length = round(2 * max(room_width, room_height));
var dir = point_direction(x1, y1, x2, y2) + 0.001;
length *= lineseg_getK_all(x1, y1, x1 + lengthdir_x(length, dir), y1 + lengthdir_y(length, dir));
draw_line(x1, y1, x1 + lengthdir_x(length, dir), y1 + lengthdir_y(length, dir));