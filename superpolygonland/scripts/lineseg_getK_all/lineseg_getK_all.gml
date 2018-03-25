/// lineseg_getK_all(x1, y1, x2, y2)
/*
 * compares the given line segment with all wallygon line segments in the room, and retruns the
 * proper length.
*/

var ox = argument0;
var oy = argument1;
var ex = argument2;
var ey = argument3;

var k = -1;
var lowk = 1;

for (var i = 0; i < ds_list_size(wallygons); i++) {
	var sides = wallygons[| i].sides;
	for (var j = 0; j < ds_list_size(wallygons[| i].points_x); j++) {
		
		k = lineseg_getK(ox, oy,
				ex, ey,
				wallygons[| i].points_x[| j], wallygons[| i].points_y[| j],
				wallygons[| i].points_x[| (j+1)%sides], wallygons[| i].points_y[| (j+1)%sides]);
		if (k < lowk && k >= 0) {
			lowk = k;
		}
	}
}

return lowk;