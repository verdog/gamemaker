///Place objects

var grid = global.room_grid;
var i, j;
var xwid = ds_grid_width(global.room_grid);
var yhei = ds_grid_height(global.room_grid);

// Delete objects

with(obj_block){
    instance_destroy();
}

with(obj_block_bg){
    instance_destroy();
}

with (obj_full){
    instance_destroy();
}

with (obj_air){
    instance_destroy();
}

with (obj_brick){
    instance_destroy();
}

with (obj_door_1){
    instance_destroy();
}

with (obj_door_2){
    instance_destroy();
}

with (obj_door_prev){
    instance_destroy();
}

with (obj_spawn){
    instance_destroy();
}

// Scan
for (i=0; i<xwid; i++)
{
    for (j=0; j<yhei; j++)
    {
        // Place doors
        if (grid[#i, j] == Cell.DOOR1){
            if !place_meeting(i*T, j*T, obj_door_1) instance_create(i*T, j*T, obj_door_1);
        }
        
        if (grid[#i, j] == Cell.DOOR2){
            if !place_meeting(i*T, j*T, obj_door_2) instance_create(i*T, j*T, obj_door_2);
        }
        
        if (grid[#i, j] == Cell.DOORP){
            if !place_meeting(i*T, j*T, obj_door_prev) instance_create(i*T, j*T, obj_door_prev);
        }
        
        // enemy spawns
        if (grid[#i, j] == Cell.SPAWN){
            if !place_meeting(i*T, j*T, obj_spawn) instance_create(i*T,j*T,obj_spawn);
        }
    }
}

// special properties
if (room_get_name(room) != "rm_editor"){
    // Door swap
    /*
    if (global.room_properties[# global.curlvl, 0] == true && 
        instance_exists(obj_door_1) && instance_exists(obj_door_2)){
        
        // swap positions
        var tx = obj_door_1.x;
        var ty = obj_door_1.y;
        obj_door_1.x = obj_door_2.x;
        obj_door_1.y = obj_door_2.y;
        obj_door_2.x = tx;
        obj_door_2.y = ty;
        
    }
    */
    if (global.room_properties[# global.curlvl, 1] == false) {
        if (instance_exists(obj_door_2)){
            with (obj_door_2){instance_destroy();};
        }
    }
}
