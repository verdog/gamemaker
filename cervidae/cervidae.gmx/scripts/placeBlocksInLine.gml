///placeBlocksInLine(real prevx, real prevy, real dx, real dy);

var pxx = argument0;
var pyy = argument1;
var dxx = argument2;
var dyy = argument3;

// Check along line
for (var i = 0; i <= prec; i++) { // DISGUSTING
    x = T*((pxx + i/prec * dxx) div T);
    y = T*((pyy + i/prec * dyy) div T);
    if (!place_meeting(x,y,all))
    {
        // delete old doors
        if (current == obj_door_1)
            with (obj_door_1) instance_destroy();
        if (current == obj_door_2)
            with (obj_door_2) instance_destroy();
        if (current == obj_door_prev)
            with (obj_door_prev) instance_destroy();
        
        // Create
        with (instance_create(x,y,current)){
            depth = -100;   
        }
    }
}


