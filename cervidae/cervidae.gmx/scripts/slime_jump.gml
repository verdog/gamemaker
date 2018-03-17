/// slime_jump

var direct;

if (object_exists(obj_player))
{
    direct = obj_player.x - x;
}
else
{
    direct = 0;
}

// Don't allow 0

while (direct == 0)
{
    direct = random_range(-1,1);
}

if (onground(x,y))
{
    spd_y = -jump_power*random_range(0.95,1.15);
    spd_x = random_range(1.7, 2.3)*sign(direct);
}
