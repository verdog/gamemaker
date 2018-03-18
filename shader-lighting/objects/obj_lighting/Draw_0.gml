var stretch = .05 * max(room_width, room_height);

if (surface_exists(sr_light)) {
	surface_set_target(sr_light);
	
	draw_clear_alpha(c_black, 0);

	// draw_sprite(spr_lightgrad, sprite_index, mouse_x, mouse_y);
	
	for (var i = 0; i < instance_number(obj_wall) * 4; i += 4)
	{
		var dir0 = point_direction(mouse_x, mouse_y, lightpoints_x[| i  ], lightpoints_y[| i  ]);
		var dir1 = point_direction(mouse_x, mouse_y, lightpoints_x[| i+1], lightpoints_y[| i+1]);
		var dir2 = point_direction(mouse_x, mouse_y, lightpoints_x[| i+2], lightpoints_y[| i+2]);
		var dir3 = point_direction(mouse_x, mouse_y, lightpoints_x[| i+3], lightpoints_y[| i+3]);
		
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(lightpoints_x[| i], lightpoints_y[| i]);
		draw_vertex(lightpoints_x[| i] + lengthdir_x(stretch, dir0), lightpoints_y[| i] + lengthdir_y(stretch, dir0));
		draw_vertex(lightpoints_x[| i+1], lightpoints_y[| i+1]);
		draw_vertex(lightpoints_x[| i+1] + lengthdir_x(stretch, dir1), lightpoints_y[| i+1] + lengthdir_y(stretch, dir1));
		draw_vertex(lightpoints_x[| i+2], lightpoints_y[| i+2]);
		draw_vertex(lightpoints_x[| i+2] + lengthdir_x(stretch, dir2), lightpoints_y[| i+2] + lengthdir_y(stretch, dir2));
		draw_vertex(lightpoints_x[| i+3], lightpoints_y[| i+3]);
		draw_vertex(lightpoints_x[| i+3] + lengthdir_x(stretch, dir3), lightpoints_y[| i+3] + lengthdir_y(stretch, dir3));
		draw_vertex(lightpoints_x[| i], lightpoints_y[| i]);
		draw_vertex(lightpoints_x[| i] + lengthdir_x(stretch, dir0), lightpoints_y[| i] + lengthdir_y(stretch, dir0));
		draw_primitive_end();
		
		// fill in the top "square"
		draw_primitive_begin(pr_trianglefan);
		draw_vertex(lightpoints_x[| i] + lengthdir_x(stretch, dir0), lightpoints_y[| i] + lengthdir_y(stretch, dir0));
		draw_vertex(lightpoints_x[| i+1] + lengthdir_x(stretch, dir1), lightpoints_y[| i+1] + lengthdir_y(stretch, dir1));
		draw_vertex(lightpoints_x[| i+2] + lengthdir_x(stretch, dir2), lightpoints_y[| i+2] + lengthdir_y(stretch, dir2));
		draw_vertex(lightpoints_x[| i+3] + lengthdir_x(stretch, dir3), lightpoints_y[| i+3] + lengthdir_y(stretch, dir3));
		draw_primitive_end()
	}

	surface_reset_target();
}

if (surface_exists(sr_debug)) {
	surface_set_target(sr_debug);
	
	draw_clear_alpha(c_black, 0);
	
	for (var i=0; i<ds_list_size(lightpoints_x); i++) {	
		
		//draw_set_color(c_blue);
		//draw_line(mouse_x, mouse_y, lightpoints_x[| i], lightpoints_y[| i]);
		
		var dirx = point_direction(mouse_x, mouse_y, lightpoints_x[| i], lightpoints_y[| i]);
		draw_set_color(c_white);
		//draw_arrow(lightpoints_x[| i], lightpoints_y[| i], lightpoints_x[| i] + lengthdir_x(stretch, dirx), lightpoints_y[| i] + lengthdir_y(stretch, dirx), 8);
	
		//draw_set_color(c_green);
		//draw_circle(lightpoints_x[| i], lightpoints_y[| i],3,false);
	}
	
	draw_set_color(c_white);
	
	for (var i = 0; i < instance_number(obj_wall) * 4; i += 4)
	{
		var dir0 = point_direction(mouse_x, mouse_y, lightpoints_x[| i  ], lightpoints_y[| i  ]);
		var dir1 = point_direction(mouse_x, mouse_y, lightpoints_x[| i+1], lightpoints_y[| i+1]);
		var dir2 = point_direction(mouse_x, mouse_y, lightpoints_x[| i+2], lightpoints_y[| i+2]);
		var dir3 = point_direction(mouse_x, mouse_y, lightpoints_x[| i+3], lightpoints_y[| i+3]);
		
		draw_primitive_begin(pr_linelist);
		draw_vertex(lightpoints_x[| i], lightpoints_y[| i]);
		draw_vertex(lightpoints_x[| i] + lengthdir_x(stretch, dir0), lightpoints_y[| i] + lengthdir_y(stretch, dir0));
		
		//draw_vertex(lightpoints_x[| i] + lengthdir_x(stretch, dir0), lightpoints_y[| i] + lengthdir_y(stretch, dir0));
		//draw_vertex(lightpoints_x[| i+1], lightpoints_y[| i+1]);
		
		draw_vertex(lightpoints_x[| i+1], lightpoints_y[| i+1]);
		draw_vertex(lightpoints_x[| i+1] + lengthdir_x(stretch, dir1), lightpoints_y[| i+1] + lengthdir_y(stretch, dir1));
		
		//draw_vertex(lightpoints_x[| i+1] + lengthdir_x(stretch, dir1), lightpoints_y[| i+1] + lengthdir_y(stretch, dir1));
		//draw_vertex(lightpoints_x[| i+2], lightpoints_y[| i+2]);
		
		draw_vertex(lightpoints_x[| i+2], lightpoints_y[| i+2]);
		draw_vertex(lightpoints_x[| i+2] + lengthdir_x(stretch, dir2), lightpoints_y[| i+2] + lengthdir_y(stretch, dir2));
		
		//draw_vertex(lightpoints_x[| i+2] + lengthdir_x(stretch, dir2), lightpoints_y[| i+2] + lengthdir_y(stretch, dir2));
		//draw_vertex(lightpoints_x[| i+3], lightpoints_y[| i+3]);
		
		draw_vertex(lightpoints_x[| i+3], lightpoints_y[| i+3]);
		draw_vertex(lightpoints_x[| i+3] + lengthdir_x(stretch, dir3), lightpoints_y[| i+3] + lengthdir_y(stretch, dir3));
		
		//draw_vertex(lightpoints_x[| i+3] + lengthdir_x(stretch, dir3), lightpoints_y[| i+3] + lengthdir_y(stretch, dir3));
		//draw_vertex(lightpoints_x[| i], lightpoints_y[| i]);
		
		draw_vertex(lightpoints_x[| i] + lengthdir_x(stretch, dir0), lightpoints_y[| i] + lengthdir_y(stretch, dir0));
		draw_vertex(lightpoints_x[| i+1] + lengthdir_x(stretch, dir1), lightpoints_y[| i+1] + lengthdir_y(stretch, dir1));
		
		draw_vertex(lightpoints_x[| i+1] + lengthdir_x(stretch, dir1), lightpoints_y[| i+1] + lengthdir_y(stretch, dir1));
		draw_vertex(lightpoints_x[| i+2] + lengthdir_x(stretch, dir2), lightpoints_y[| i+2] + lengthdir_y(stretch, dir2));
		
		draw_vertex(lightpoints_x[| i+2] + lengthdir_x(stretch, dir2), lightpoints_y[| i+2] + lengthdir_y(stretch, dir2));
		draw_vertex(lightpoints_x[| i+3] + lengthdir_x(stretch, dir3), lightpoints_y[| i+3] + lengthdir_y(stretch, dir3));
		
		draw_vertex(lightpoints_x[| i+3] + lengthdir_x(stretch, dir3), lightpoints_y[| i+3] + lengthdir_y(stretch, dir3));
		draw_vertex(lightpoints_x[| i] + lengthdir_x(stretch, dir0), lightpoints_y[| i] + lengthdir_y(stretch, dir0));
		draw_primitive_end();
		
		draw_primitive_begin(pr_linestrip);
		//draw_vertex(lightpoints_x[| i], lightpoints_y[| i]);
		//draw_vertex(lightpoints_x[| i+1], lightpoints_y[| i+1]);
		//draw_vertex(lightpoints_x[| i+2], lightpoints_y[| i+2]);
		//draw_vertex(lightpoints_x[| i+3], lightpoints_y[| i+3]);
		//draw_vertex(lightpoints_x[| i], lightpoints_y[| i]);
		draw_primitive_end();
	}
	
	surface_reset_target();
}

//gpu_set_blendmode(bm_subtract);
draw_surface_ext(sr_light, 0, 0, 1, 1, 0, -1, 1);
draw_surface_ext(sr_debug, 0, 0, 1, 1, 0, -1, 0.1);
gpu_set_blendmode(bm_normal);