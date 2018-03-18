/// init
sr_light = surface_create(room_width, room_height);
sr_debug = surface_create(room_width, room_height);
lightpoints_x = ds_list_create();
lightpoints_y = ds_list_create();

depth = -10;