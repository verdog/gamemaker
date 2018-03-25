if !(surface_exists(sr_vis)) {
	sr_vis = surface_create(room_width, room_height);
}

x = mouse_x;
y = mouse_y;
dummy.x = room_width - x;
dummy.y = room_height - y;
draw_sprite(sprite_index, -1, x, y);

surface_set_target(sr_vis) {
	draw_clear_alpha(c_white, 1);
	draw_set_color(c_black);
	draw_visible_area();
	x = dummy.x;
	y = dummy.y;
	draw_visible_area();
} surface_reset_target();

gpu_set_blendmode(bm_subtract);
draw_surface(sr_vis, 0, 0);
gpu_set_blendmode(bm_normal);