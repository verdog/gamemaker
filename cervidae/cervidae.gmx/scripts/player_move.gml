/// Movement of player

var part_num; // Number of particles to spawn when jumping (and other various cases)

// Debug

debugkey("X");
breakkey("B");

// Flying

if (fly) 
{
    player_move_fly();
    exit;
}

/****
*****
* X *
*****
*****/

/***********
* Controls *
************/

// Read keyboard

global.key_right = keyboard_check(map_right) || gamepad_axis_value(0, gp_axislh) > 0.22;
global.key_left = keyboard_check(map_left) || gamepad_axis_value(0, gp_axislh) < - 0.22;
key_none_x = ((global.key_right && global.key_left) || (!global.key_right && !global.key_left)) && abs(gamepad_axis_value(0, gp_axislh)) <= 0.3;

// Read

if (global.key_right)
{
    // analog controller speed control
    var move_intensity;
    move_intensity = lerp(0,move_max_x,gamepad_axis_value(0, gp_axislh));
    
    // max if key
    if (keyboard_check(map_right)) move_intensity = move_max_x;
    
    if (spd_x < move_intensity)
        input_x = acc_x;
    else
        input_x = 0;
        
    dir = 1;
}

if (global.key_left) 
{
// analog controller speed control
    var move_intensity;
    move_intensity = lerp(0,move_max_x,-gamepad_axis_value(0, gp_axislh));
    
    // max if key
    if (keyboard_check(map_left)) move_intensity = move_max_x;
    
    if (spd_x > -move_intensity)
        input_x = -acc_x;
    else
        input_x = 0;
        
    dir = -1;
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
        if (!grid_place_meeting(x,y)){
            // Move until meeting
            x += sign(spd_x);
        }
    }
    
    // Stop moving
    spd_x = 0;
}

/***********
* Friction *
************/

// Ground friction
if (onground(x,y) && key_none_x)
{
    spd_x = spd_x * frict_x;
}

if (!key_none_x)
{
    if (abs(spd_x) > move_max_x)
    {
        spd_x = spd_x * 0.96;
    }
}

// Air friction
if (!onground(x,y) && key_none_x)
{
    spd_x = spd_x * frict_air;
}

// Switch direction particles

if (onground(x,y) && dir_prev != dir) || // Switch directions
    (onground(x,y) && spd_x_prev == 0 && spd_x > 0.2) // Standstill
{
    // Kick up dust
    
    // sound
    if (!audio_is_playing(snd_tinynoise)){
        audio_play_sound(snd_tinynoise, 10, false);
    }
    
    // Check material
    if (grid_type(x+8,y+17) == Cell.BLOCK) part_num = 2;
    else if (grid_type(x+8,y+17) == Cell.BRICK) part_num = 1;
    else part_num = 1;
    
    repeat(part_num)
    {
        var dust;
        dust = prts_walkdust(x+8,y+14,0);
        
        with (dust)
        {
            spd_x = sign(obj_player.spd_x+0.00001)*random_range(-0.4,0);
            spd_y = -random_range(0.2,1.2);
        }
    }
}

// Apply

spd_x = clamp(spd_x, -global.physics_spd_x_max, global.physics_spd_x_max);
x += spd_x;

/****
*****
* Y *
*****
*****/

/***********
* Controls *
************/

// Read keyboard

global.key_up = keyboard_check_pressed(map_up) || gamepad_button_check_pressed(0, gp_face1); //|| keyboard_check_pressed(vk_space);
global.key_up_held = keyboard_check(map_up) || gamepad_button_check(0, gp_face1);
global.key_up_release = keyboard_check_released(map_up) || gamepad_button_check_released(0, gp_face1);
global.key_down = keyboard_check(map_down);
global.key_down_release = keyboard_check_released(map_down) || gamepad_button_check_released(0, gp_face4);
global.stick_down =  gamepad_axis_value(0, gp_axislv) >= 0.75 && abs(gamepad_axis_value(0,gp_axislh)) <= 0.80;
global.stick_up =  gamepad_axis_value(0, gp_axislv) <= -0.75 && abs(gamepad_axis_value(0,gp_axislh)) <= 0.80;
input_y = 0;

// Jumping

if (global.key_up && onground(x,y) && spd_y >= 0)
{
    spd_y = 0;
    input_y = -jump_power;
    
    // Particles
    
    // Check material
    if (grid_type(x+8,y+17) == Cell.BLOCK) part_num = 2;
    else if (grid_type(x+8,y+17) == Cell.BRICK) part_num = 1;
    else part_num = 1;
    
    repeat(part_num)
    {
        var dust;
        dust = prts_walkdust(x+8,y+14,0);
        
        with (dust)
        {
            spd_x = random_range(-0.7,0.7);
            spd_y = -random_range(0.2,1.2);
        }
    }
    
    // Sound
    
    audio_play_sound(snd_tinyjump, 30, false);
}

// Variable jump

if (spd_y < 0 && !global.key_up_held)
{
    spd_y = spd_y * 0.86;
}

spd_y += input_y;

// Gravity

spd_y += grav_personal;

/*************
* Collisions *
**************/

// Vertical

if (grid_place_meeting(x,y+spd_y))
{
    // Gonna hit something, move right next to it
    if (!grid_place_meeting(x,y)){
        while (!grid_place_meeting(x,y+sign(spd_y)))
        {
        // Move until meeting
        y += sign(spd_y);
        }
    }
    
    /**************
    * Impact dust *
    **************/
    
    if (spd_y > 0.5)
    {
        // Kick up dust //
        
        //show_debug_message("Impact dust triggered on t = " + string(global.time));
        
        // Adjust part_num
        part_num = spd_y;
        
        // Check material
        if (grid_type(x+8,y+17) == Cell.BLOCK) part_num = part_num*3;
        else if (grid_type(x+8,y+17) == Cell.BRICK) part_num = part_num*1.5;
        else part_num = 1;
        
        part_num = round(part_num);
        //show_debug_message("pn: " + string(part_num));
        
        // sound
        if (!audio_is_playing(snd_tinynoise)){
            audio_play_sound(snd_tinynoise, 10, false);
        }
        
        repeat(part_num)
        {
            var dust;
            dust = prts_walkdust(x+8,y+14,0);
            
            with (dust)
            {
                spd_x = obj_player.spd_x*0.8 + random_range(-1.4,1.4);
                spd_y = -random_range(0.1,obj_player.spd_y*0.3);
            }
        }
    }
    
    // Stop moving
    spd_y = 0;
}

/***********
* Friction *
************/

// Wall friction
if (grid_place_meeting(x+sign(spd_x),y) && spd_y > 0 && input_x != 0)
{
    if (spd_y > spd_wallslide)
    {
        spd_y = spd_y * frict_wall;
    }
}

// Apply

spd_y = clamp(spd_y, -global.physics_spd_y_max, global.physics_spd_y_max);
y += spd_y;

// Update p's
spd_x_prev = spd_x; // spd_x of previous frame
dir_prev = dir;
onground_prev = onground(x,y); // Grounded status on previous frame

// Update weapon

// position
if (instance_exists(obj_weapon)){
    obj_weapon.x = x+8 + sign(dir)*obj_weapon.wp_x[obj_weapon.wp_current] + gun_xbobble();
    obj_weapon.y = y+8 + obj_weapon.wp_y[obj_weapon.wp_current] + gun_ybobble();
}

// restart if outside of room
if (x > room_width +2*T || x < -2*T || y > room_height + 2*T || y < -2*T){
    room_speed = 15;
    obj_camera.alarm[10] = 45;
    invuln = true;
    alarm[0] = 45;
    level_restart();
}
