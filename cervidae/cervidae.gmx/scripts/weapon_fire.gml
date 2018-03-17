/// weapon_fire( int wp_current )

var wep = argument0;

var bullx = obj_weapon.x + lengthdir_x(obj_weapon.wp_bullet_x[wep],obj_weapon.rot*obj_weapon.dir + (90 - 90*obj_weapon.dir));
var bully = obj_weapon.y + lengthdir_y(obj_weapon.wp_bullet_x[wep],obj_weapon.rot*obj_weapon.dir);

// Shoot
switch (wep){
    case 1: // Pea
        weapon_shoot_pea(bullx, bully);
    break;
    
    case 2: // Triple
        weapon_shoot_triple(bullx, bully, 0);
    break;
    
    case 3: // Biggun
        weapon_shoot_biggun(bullx,bully);
    break;
    
    case 4: // Shotty
        weapon_shoot_shotty(bullx, bully);
    break;
    
    case 5: // Grenade
        weapon_shoot_grenade(bullx, bully);
    break;
    
    default:
}
