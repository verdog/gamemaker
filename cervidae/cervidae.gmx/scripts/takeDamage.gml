/// takeDamage(int amount)

var dmg;
dmg = argument0;

// subtract from health

hp -= dmg;

// check if dead

if (hp <= 0){
    // die
    dead = true;
}

