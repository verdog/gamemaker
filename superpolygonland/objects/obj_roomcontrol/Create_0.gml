randomize();

for (var i=0; i<12; i++) {
	instance_create_depth(irandom(room_width), irandom(room_height), -50, obj_wallygon);	
}

//instance_create_depth(0,0,0,obj_visibility);
instance_create_depth(0,0,0,obj_debug);
instance_create_depth(0,0,0,obj_lightsource);
