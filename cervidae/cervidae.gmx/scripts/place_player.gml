/// place_player()
// places the player at a p door, if it exists

// place player

if (instance_exists(obj_door_prev) && instance_exists(obj_player))
{
    // player
    
    obj_player.x = obj_door_prev.x;
    obj_player.y = obj_door_prev.y;
    
    // camera
    
    obj_camera.x = obj_player.x;
    obj_camera.y = obj_player.y;
}
else if (instance_exists(obj_player))
{
    obj_player.x = 336;
    obj_player.y = 272;
}
