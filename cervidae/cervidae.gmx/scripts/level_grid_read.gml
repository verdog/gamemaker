/// this function scans the level for objects, then stores them in the global.room_grid
// Set collision mask

mask_index = mask_block;

// Read level

for (var i=0; i<ds_grid_width(global.room_grid); i++)
{
    for (var j=0; j<ds_grid_height(global.room_grid); j++)
    {
        // clear old doors/spawns
        
        if (instance_number(obj_door_1) == 0 && global.room_grid[# i, j] == Cell.DOOR1)
            global.room_grid[# i, j] = Cell.AIR;
        if (instance_number(obj_door_2) == 0 && global.room_grid[# i, j] == Cell.DOOR2)
            global.room_grid[# i, j] = Cell.AIR;
        if (instance_number(obj_door_prev) == 0 && global.room_grid[# i, j] == Cell.DOORP)
            global.room_grid[# i, j] = Cell.AIR;
        if (instance_number(obj_spawn) == 0 && global.room_grid[# i, j] == Cell.SPAWN)
            global.room_grid[# i, j] = Cell.AIR;
    
        // read level
            
        if (place_meeting(i*T, j*T, obj_block)){
            // block
            global.room_grid[# i, j] = Cell.BLOCK;
        }
        else if (place_meeting(i*T, j*T, obj_block_bg))
        {
            // bgblock
            global.room_grid[# i, j] = Cell.BGBLOCK;
        }
        else if (place_meeting(i*T, j*T, obj_brick)){
            // brick
            global.room_grid[# i, j] = Cell.BRICK;
        }
        else if (place_meeting(i*T, j*T, obj_full)){
            // full
            global.room_grid[# i, j] = Cell.FULL;    
        }
        else if (place_meeting(i*T, j*T, obj_air)){   
            // air
            global.room_grid[# i, j] = Cell.AIR;
        }
        else if (place_meeting(i*T, j*T, obj_door_1)){   
            // door1
            global.room_grid[# i, j] = Cell.DOOR1;
        }
        else if (place_meeting(i*T, j*T, obj_door_2)){   
            // door2
            global.room_grid[# i, j] = Cell.DOOR2;
        }
        else if (place_meeting(i*T, j*T, obj_door_prev)){   
            // doorp
            global.room_grid[# i, j] = Cell.DOORP;
        }
        else if (place_meeting(i*T, j*T, obj_spawn)){
            // enemy spawn
            global.room_grid[# i, j] = Cell.SPAWN;
        }
    }
}
