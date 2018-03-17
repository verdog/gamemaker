/// weapon_shoot_pea( real x, real y)
// script for pea shooter weapon
// argument0: x coordinate of origin of bullet
// argument1: y coordinate of origin of bullet

var wep = 1;

var bullx = argument0;
var bully = argument1;

obj_weapon.alarm[0] = 3;
obj_weapon.canFire = false;

var bullet;
bullet = instance_create(bullx, bully, obj_bullet);

with (bullet)
{
    // default values
    var angle = random(360);
    spd_x = obj_player.spd_x*0.75 + lengthdir_x(.2,angle);
    spd_y = obj_player.spd_y*0.75 + lengthdir_y(.2,angle);
    
    spd_x += lengthdir_x(obj_weapon.wp_speed[wep],obj_weapon.rot*obj_weapon.dir + (90 - 90*obj_weapon.dir));
    spd_y += lengthdir_y(obj_weapon.wp_speed[wep],obj_weapon.rot*obj_weapon.dir);
    
    // flip sprite
    xscale = obj_player.dir;
    
    // decay alarm
    alarm[0] = 20;
}

//Recoil
var multi = 1;
if (onground(x,y)){multi =  .3};
obj_player.spd_x += multi*lengthdir_x(obj_weapon.wp_recoil[wep],obj_weapon.rot + (90 + 90*obj_weapon.dir));
obj_player.spd_y += multi*lengthdir_y(obj_weapon.wp_recoil[wep],obj_weapon.rot + (90 + 90*obj_weapon.dir));

// Gun smoke
if (!global.debug){
    repeat(3)
    {
        with (prts_poof(bullx,bully,1.2,random(360)))
        {
            xscale = obj_player.dir;
        }
    }
    prts_poof_mid(bullx,bully,1,random(360));
}

// Sound
audio_play_sound(snd_tinyshoot, 30, false);

return bullet;
