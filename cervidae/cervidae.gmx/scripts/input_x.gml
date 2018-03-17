// Maps

key_right = keyboard_check(ord('D'));
key_left = keyboard_check(ord('A'));

// Read

if (key_right && key_left) return 0;

if (key_right && spd_x < move_max_x) return acc_x;
if (key_left && spd_x > -move_max_x) return -acc_x;

return 0;
