/// Movement of player

/****
*****
* X *
*****
*****/

/***********
* Controls *
************/

// Read keyboard

global.key_right = keyboard_check(map_right);
global.key_left = keyboard_check(map_left);
key_none_x = (global.key_right && global.key_left) || (!global.key_right && !global.key_left);

// Read

if (global.key_right)
{
    if (spd_x < move_max_x)
        input_x = acc_x;
    else
        input_x = 0;
}

if (global.key_left) 
{
    if (spd_x > -move_max_x)
        input_x = -acc_x;
    else
        input_x = 0;
}

if (key_none_x)
{
    input_x = 0;
}

spd_x += input_x;

/*************
* Collisions *
**************/

// Horizontal

if grid_place_meeting(x+spd_x,y)
{ 
    // Gonna hit something, move right next to it
    while (!grid_place_meeting(x+sign(spd_x),y))
    {
        // Move until meeting
        x += sign(spd_x);
    }
    
    // Stop moving
    spd_x = 0;
}

/***********
* Friction *
************/

// Air friction
if (key_none_x)
{
    spd_x = spd_x * frict_air_fly;
}

// Apply

spd_x = clamp(spd_x, -global.physics_spd_x_max, global.physics_spd_x_max);
x += spd_x;
x = round(x);

/****
*****
* Y *
*****
*****/

/***********
* Controls *
************/

// Read keyboard

global.key_up = keyboard_check(map_up);
global.key_down = keyboard_check(map_down);
key_none_y = (global.key_up && global.key_down) || (!global.key_up && !global.key_down);

input_y = 0;

// Vertical

if (global.key_up)
{
    if (spd_y > -move_max_y)
        input_y = -acc_y;
    else
        input_y = 0;
}

if (global.key_down)
{
    if (spd_y < move_max_y)
        input_y = acc_y;
    else
        input_y = 0;
}

spd_y += input_y;

/*************
* Collisions *
**************/

// Vertical

if (grid_place_meeting(x,y+spd_y))
{
    // Gonna hit something, move right next to it
    while (!grid_place_meeting(x,y+sign(spd_y)))
    {
        // Move until meeting
        y += sign(spd_y);
    }
    
    // Stop moving
    spd_y = 0;
}

/***********
* Friction *
************/

// Air friction
if (key_none_y)
{
    spd_y = spd_y * frict_air_fly;
}

// Apply

spd_y = clamp(spd_y, -global.physics_spd_y_max, global.physics_spd_y_max);
y += spd_y;
y = round(y);
