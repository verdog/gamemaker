/// prt_walkdust(x,y,bool use_random_chances)
// spawn a particle at x,y

var xx = argument[0];
var yy = argument[1];
var cc = argument[2];

var caller_spd_x = spd_x;

var chance;
var material = grid_type(xx,yy+16); // Type of block one below yy

var dust; // Particle object id

// random chances

if (material == Cell.BLOCK) chance = 7; // " 7 in 100 "
else if (material == Cell.BRICK) chance = 2;
else chance = 1;

if (cc = false) chance = 100;

// Spawn the particle

if (irandom(99) < chance) 
{
    dust = instance_create(xx,yy,prt_dust);

    // Set properties
    
    with (dust)
    {
        // Speed
        spd_x = sign(caller_spd_x+0.0001)*random_range(-0.5,0.25);
        spd_y = -random_range(0.2,0.7);
        
        // Change sprite depeding on material player is on
        if (material == Cell.BLOCK) // Grass/ground
        {
            sprite_index = spr_prt_grass;
            image_speed = 1/20;
        }
        else
        {
            sprite_index = spr_prt_dust;
            image_speed = 1/3;
        }
        
        image_index = irandom(image_number - 1);
        
        // alarm
        alarm[0] = irandom_range(45,75);
        
        // move to ground
        
        if (grid_place_meeting(x,y+8))
        {
            var n = 0;
            while (!grid_place_meeting(x,y+1) && n < 8)
            {
                y++;
            }
        }
    }
    
    return dust;
}

return 0;

