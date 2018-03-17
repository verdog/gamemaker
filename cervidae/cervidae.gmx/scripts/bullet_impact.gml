/// bullet_impact(target instance, precision)
// moves bullet into target and subtracts health
var target = argument0;
var prec = argument1;

// move to target
while(!place_meeting(x+spd_x*prec,y+spd_y*prec,target))
{
    x += spd_x*prec;
    y += spd_y*prec;  
}
    
// knockback
// determine arguments

bkx = bulletKnockbackX();
bky = bulletKnockbackY();

// takedamage/knockback
with (target) {
    var bullet = instance_nearest(x,y,obj_bullet);
    takeKnockback(bullet.bkx,bullet.bky);
    takeDamage(obj_bullet.damage);
}

