// draw wall

draw_set_color($111111);
draw_primitive_begin(pr_trianglefan);
for (var i=0; i<ds_list_size(points_x); i++) {
	draw_vertex(points_x[| i], points_y[| i]);
}
draw_primitive_end();