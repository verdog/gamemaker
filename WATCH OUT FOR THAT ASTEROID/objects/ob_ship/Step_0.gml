/// move

if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}

var spawn_smoke = 0;
var shoot = 0;
powered = 0;

// acceleration
if ( keyboard_check(ord("W")) || gamepad_button_check(0, gp_shoulderl))
{
	spd_x = clamp(spd_x + lengthdir_x(enginepower, rot), -maxspeed, maxspeed);
	spd_y = clamp(spd_y + lengthdir_y(enginepower, rot), -maxspeed, maxspeed);
	
	spawn_smoke = 1;
	powered = 1;
}

if (keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl) || gamepad_axis_value(0, gp_axislh) < -0.5)
{
	rot += 8;
}

if (keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr) || gamepad_axis_value(0, gp_axislh) > 0.5)
{
	rot -= 8;
}

if ((keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) || gamepad_button_check(0, gp_shoulderr))
{
	shoot = 1;	
}

// stay inbounds
if (x < -16)
{
	x = room_width + 16;
}

if (x > room_width + 16)
{
	x = -16;
}

if (y < -16)
{
	y = room_height + 16;	
}

if (y > room_height + 16)
{
	y = -16;
}

rot %= 360;
direction = rot;

x += spd_x;
y += spd_y;

if (spawn_smoke)
{
	var smoke = instance_create_depth(
					x + lengthdir_x(10, (rot + 180)%360),
					y + lengthdir_y(10, (rot + 180)%360),
					depth+50,ob_smoke);
	
	smoke.spd_x = lengthdir_x(random_range(7,11), (rot + 180)%360);
	smoke.spd_y = lengthdir_y(random_range(7,11), (rot + 180)%360);
}

if (shoot && canshoot)
{
	var bullet = instance_create_depth(
					x + lengthdir_x(15, rot + random_range(-6,6)),
					y + lengthdir_y(15, rot + random_range(-6,6)),
					depth+50, ob_bullet);
					
	bullet.spd_x = spd_x*0.9 + lengthdir_x(24 + random_range(-1, 1), rot);
	bullet.spd_y = spd_y*0.9 + lengthdir_y(24 + random_range(-1, 1), rot);
	bullet.rot = rot;
	
	canshoot = false;
	alarm[0] = shoot_cooldown;
}