/// weapon_control()
// General weapon control

// Exit if not holding a weapon

if (!instance_exists(obj_weapon)) exit;
if (obj_weapon.wp_current == 0) exit;

var key_fire = gamepad_button_check_pressed(0, gp_face3);// || (gamepad_button_check(0, gp_face3) && global.time mod 1 == 0);

// Debug
//var key_fire = keyboard_check(obj_weapon.map_fire) || gamepad_button_check(0, gp_face3);

if (key_fire && obj_weapon.canFire) {
    weapon_fire(obj_weapon.wp_current);
}
