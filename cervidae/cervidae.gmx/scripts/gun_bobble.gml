/// gun_bobble
// returns the offset of the dog's animation

if (obj_weapon.weapon_number == 1) // Pea
{
    if (obj_player.sprite_index == s_dog_idle) // Idle
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

    if (obj_player.sprite_index == s_dog_run) // Run
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
}

return 0;
