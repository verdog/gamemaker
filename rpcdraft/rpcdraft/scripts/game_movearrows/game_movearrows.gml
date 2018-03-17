// controls arrow selection/movement

//p1_right = gamepad_button_check_pressed(0, gp_padr);
//p1_left  = gamepad_button_check_pressed(0, gp_padl);
//p2_right = gamepad_button_check_pressed(1, gp_padr);
//p2_left  = gamepad_button_check_pressed(1, gp_padl);

//if p1_right {
//	if (p1_arrow.selectedcard + 1 >= ds_list_size(cards_p1)) {
//		p1_arrow.selectedcard = 0;
//	} else {
//		p1_arrow.selectedcard++;
//	}
	
//	with (p1_arrow) { arrow_jumptocard(obj_gamecontrol.cards_p1[| selectedcard]); }
//}

//if p1_left {
//	if (p1_arrow.selectedcard - 1 < 0) {
//		p1_arrow.selectedcard = ds_list_size(cards_p1) - 1;
//	} else {
//		p1_arrow.selectedcard--;
//	}
	
//	with (p1_arrow) { arrow_jumptocard(obj_gamecontrol.cards_p1[| selectedcard]); }
//}

//if p2_right {
//	if (p2_arrow.selectedcard + 1 >= ds_list_size(cards_p2)) {
//		p2_arrow.selectedcard = 0;
//	} else {
//		p2_arrow.selectedcard++;
//	}
	
//	with (p2_arrow) { arrow_jumptocard(obj_gamecontrol.cards_p2[| selectedcard]); }
//}

//if p2_left {
//	if (p2_arrow.selectedcard - 1 < 0) {
//		p2_arrow.selectedcard = ds_list_size(cards_p2) - 1;
//	} else {
//		p2_arrow.selectedcard--;
//	}
	
//	with (p2_arrow) { arrow_jumptocard(obj_gamecontrol.cards_p2[| selectedcard]); }
//}