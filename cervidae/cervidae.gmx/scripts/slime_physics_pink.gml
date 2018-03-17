/// Movement of pink slime

var part_num; // Number of particles to spawn when jumping (and other various cases)

var caller_spd_x = spd_x;
var caller_spd_y = spd_y;

/****
*****
* X *
*****
*****/

/*************
* Collisions *
**************/

// lunge

if (!onground(x,y))
{
    var direct;
    direct = obj_player.x - x;
    
    spd_x += (1/50)*(sign(direct));
}

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

// Ground friction
if (onground(x,y))
{
    spd_x = spd_x * frict_x;
}

// Air friction
if (!onground(x,y))
{
    spd_x = spd_x * frict_air;
}

////////////////////////////////
// Switch direction particles //
////////////////////////////////

if (onground(x,y) && dir_prev != dir) || // Switch directions
    (onground(x,y) && spd_x_prev == 0 && spd_x > 0.2) // Standstill
{
    // Kick up dust
    
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
            spd_x = sign(caller_spd_x+0.00001)*random_range(-0.4,0);
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

// Gravity

spd_y += grav_personal;

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
    
    /**************
    * Impact dust *
    **************/
    
    if (spd_y > 0.5)
    {
        // Kick up dust //
        
        //show_debug_message("slime impact dust triggered on t = " + string(global.time));
        
        // Adjust part_num
        part_num = spd_y;
        
        // Check material
        if (grid_type(x+8,y+17) == Cell.BLOCK) part_num = part_num*3;
        else if (grid_type(x+8,y+17) == Cell.BRICK) part_num = part_num*1.5;
        else part_num = 1;
        
        part_num = round(part_num);
        //show_debug_message("pn: " + string(part_num));
        
        repeat(part_num)
        {
            var dust;
            dust = prts_walkdust(x+8,y+14,0);
            
            with (dust)
            {
                spd_x = caller_spd_x*0.8 + random_range(-1.4,1.4);
                spd_y = -random_range(0.1,caller_spd_y*0.3);
            }
        }
        
        // goo bubbles
        
        repeat(part_num/3)
        {
            var goo;
            goo = prts_goo(x+random_range(2,14), y+random_range(6,13), caller_spd_x*(0.92), -0.4);
            goo.sprite_index = spr_goop_pink;
        }
    }
    
    // Stop moving
    spd_y = 0;
}

/***********
* Friction *
************/

// no y friction yet

// Apply

spd_y = clamp(spd_y, -global.physics_spd_y_max, global.physics_spd_y_max);
y += spd_y;

// Update p's
spd_x_prev = spd_x; // spd_x of previous frame
dir_prev = dir;
onground_prev = onground(x,y); // Grounded status on previous frame

// Only saving for possibility of enemies holding weapon
/*
// Update weapon

// position

obj_weapon.x = x+8 + sign(dir)*obj_weapon.wp_x[obj_weapon.wp_current] + gun_xbobble();
obj_weapon.y = y+8 + obj_weapon.wp_y[obj_weapon.wp_current] + gun_ybobble();
*/
