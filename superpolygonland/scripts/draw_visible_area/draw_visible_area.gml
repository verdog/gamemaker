/// draw_visible_area

// add corners of the room
ds_list_add(dirlist, point_direction(x, y, 0, 0));
ds_list_add(dirlist, point_direction(x, y, room_width, 0));
ds_list_add(dirlist, point_direction(x, y, 0, room_height));
ds_list_add(dirlist, point_direction(x, y, room_width, room_height));

for (var i=0; i<ds_list_size(wallygons); i++) {
	for (var j=0; j<ds_list_size(wallygons[| i].points_x); j++) {
		var x1 = x;
		var y1 = y;
		var x2 = wallygons[| i].points_x[| j];
		var y2 = wallygons[| i].points_y[| j];
		ds_list_add(dirlist, point_direction(x1, y1, x2, y2)-0.1);
		ds_list_add(dirlist, point_direction(x1, y1, x2, y2));
		ds_list_add(dirlist, point_direction(x1, y1, x2, y2)+0.1);
	}
}

ds_list_sort(dirlist, true);

var listsize = ds_list_size(dirlist)
var baselength = round(2 * max(room_width, room_height));

draw_primitive_begin(pr_trianglelist);

	for (var i=0; i<listsize; i++) {
		var x1 = x;
		var y1 = y;
		
		var klength1 = 0;
		var klength2 = 0;
		var dir1 = dirlist[| i];
		var dir2 = dirlist[| (i+1)%listsize];
				
		klength1 = baselength*lineseg_getK_all(x1, y1, x1 + lengthdir_x(baselength, dir1), y1 + lengthdir_y(baselength, dir1));
		klength2 = baselength*lineseg_getK_all(x1, y1, x1 + lengthdir_x(baselength, dir2), y1 + lengthdir_y(baselength, dir2));
		
		draw_vertex(x1, y1);
		draw_vertex(x1 + lengthdir_x(klength1, dir1), y1 + lengthdir_y(klength1, dir1));
		draw_vertex(x1 + lengthdir_x(klength2, dir2), y1 + lengthdir_y(klength2, dir2));
	}

draw_primitive_end();

ds_list_clear(dirlist);