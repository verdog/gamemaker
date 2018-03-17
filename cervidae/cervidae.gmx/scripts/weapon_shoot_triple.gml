/// weapon_shoot_triple(real x, real y, int mode)
// script for triple shooter weapon
// argument0: x coordinate of origin of bullet
// argument1: y coordinate of origin of bullet
// argument2: 0 = set alarms etc
//            1 = fire the bullet

if (argument2 == 0){ // Sets up the alarms to fire bullets
    obj_weapon.alarm[0] = 16;
    obj_weapon.canFire = false;
}

if (argument2 == 1){ // Fires the bullet
    var wep = 2;
    
    var bullx = argument0;
    var bully = argument1;
    
    var bullet;
    bullet = instance_create(bullx, bully, obj_bullet);
    
    with (bullet)
    {
        // default values
        var angle = random(360);
        // player speed and random spread
        spd_x = obj_player.spd_x*0.65 + lengthdir_x(.5,angle);
        spd_y = obj_player.spd_y*0.65 + lengthdir_y(.5,angle);
        
        // default bullet speed
        spd_x += lengthdir_x(obj_weapon.wp_speed[wep],obj_weapon.rot*obj_weapon.dir + (90 - 90*obj_weapon.dir));
        spd_y += lengthdir_y(obj_weapon.wp_speed[wep],obj_weapon.rot*obj_weapon.dir);
        
        // set sprite
        sprite_index = obj_weapon.wp_bullet_s[wep];
        
        // flip sprite
        xscale = obj_player.dir;
        
        // sprite angle
        image_angle = -arctan(spd_y/spd_x) * 180/pi; // i don't know why it's negative :^)
        
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
}
