depth = 0;

sr_vis = surface_create(room_width, room_height);

wallygons = ds_list_create();

with (obj_wallygon) {
	ds_list_add(other.wallygons, self);	
}

dirlist = ds_list_create();

dummy = instance_create_depth(0,0,depth,obj_lightsourcedummy);