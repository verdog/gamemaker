/// gun_ybobble
// returns the offset of the dog's animation
// animstate can be "idle", "moving", or "air".

if (obj_player.animstate = "idle") // Idle
{
    if ((floor(obj_player.image_index) + 1) % 2 == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

if (obj_player.animstate = "moving") // Run
{
    if ((floor(obj_player.image_index) + 1) % 3 == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

return 0;
