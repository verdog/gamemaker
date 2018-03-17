/// travel([0, 1, 2, 3], fade)
// 1 = door1
// 2 = door2
// 3 = doorp
// 0 = to start room (0)

var dest = argument0;
var fade = argument1;

if (fade == true && !instance_exists(obj_travelcontrol)){
    instance_create(0,0,obj_travelcontrol);
    with (obj_travelcontrol){
        arg = dest;
    }
} else {
    show_debug_message("travel(" + string(dest) + ") " + string(fade));
    
    if (dest == 1)
    {
        // update visitlist
        if (instance_exists(obj_map)) {
        obj_map.visitList[global.door_1_list[| global.curlvl]] = true;
        }
        
        global.curlvl = global.door_1_list[| global.curlvl];
        global.room_grid = global.room_list[| global.curlvl];
    }
    
    if (dest == 2)
    {
        // update visitlist
        if (instance_exists(obj_map)) {
        obj_map.visitList[global.door_2_list[| global.curlvl]] = true;
        }
        
        global.curlvl = global.door_2_list[| global.curlvl];
        global.room_grid = global.room_list[| global.curlvl];
    }
    
    if (dest == 0)
    {
        // update visitlist
        if (instance_exists(obj_map)) {
        obj_map.visitList[0] = true;
        }
        
        global.curlvl = 0;
        global.room_grid = global.room_list[| 0];
    }
    
    place_objects();
    tile_all_auto();
    place_player();
    place_enemies();
}
