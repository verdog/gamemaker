if (instance_exists(obj_lighting)) {
	// add points
	ds_list_add(obj_lighting.lightpoints_x, x);
	ds_list_add(obj_lighting.lightpoints_y, y);
	
	ds_list_add(obj_lighting.lightpoints_x, x + sprite_width);
	ds_list_add(obj_lighting.lightpoints_y, y);
	
	ds_list_add(obj_lighting.lightpoints_x, x + sprite_width);
	ds_list_add(obj_lighting.lightpoints_y, y + sprite_height);
	
	ds_list_add(obj_lighting.lightpoints_x, x);
	ds_list_add(obj_lighting.lightpoints_y, y + sprite_height);
}