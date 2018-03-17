// Maps

key_up = keyboard_check(ord('W'));
key_down = keyboard_check(ord('S'));

// Read

if (key_up && key_down) return 0;

// Jumping

if (key_up && grounded && spd_y >= 0)
{
    spd_y = -4;
    //spd_y = 0;
    //return -jump_power;
}

//return 0;
