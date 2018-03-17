/// setup

randomize();
startn = 7;
currentcardn = startn;
startx = 32;
xoffset = 64;
yoffset = 64;

p1_secretchoice = -1;
p2_secretchoice = -1;

// create debug printer
instance_create_depth(0,0,0,obj_debugprinter);

// create cards
cards_p1 = ds_list_create()
cards_p2 = ds_list_create()

// create buttons
buttons_p1 = ds_list_create();
buttons_p2 = ds_list_create();

for ( var i = 0; i < startn; i++ ) {
	ds_list_insert(cards_p1, i, instance_create_depth(startx + i*xoffset, yoffset, i, obj_card));
	ds_list_insert(buttons_p1, i, instance_create_depth(0, 0, i, obj_buttons));
	buttons_p1[| i].player = 1;
	with (buttons_p1[| i]) { 
		buttons_setsprite(i); 
		buttons_jumptocard(obj_gamecontrol.cards_p1[| i]);
	}
}

for ( var i = 0; i < startn; i++ ) {
	ds_list_insert(cards_p2, i, instance_create_depth(startx + i*xoffset, room_height - obj_card.sprite_width - yoffset, i, obj_card));
	ds_list_insert(buttons_p2, i, instance_create_depth(0, 0, i, obj_buttons));
	buttons_p2[| i].player = 2;
	with (buttons_p2[| i]) { 
		buttons_setsprite(i); 
		buttons_jumptocard(obj_gamecontrol.cards_p2[| i]);
	}
}
