/// press l to increase level

if (keyboard_check_pressed(ord("L")))
{
	global.level++;
	room_restart();
}
