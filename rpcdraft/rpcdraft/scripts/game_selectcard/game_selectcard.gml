/// choose a card

P1RIGHT =  1 *  gamepad_button_check(0, gp_padr) || keyboard_check(ord("D"));
P1UP    =  2 * (gamepad_button_check(0, gp_padu) || keyboard_check(ord("W")));
P1LEFT  =  4 * (gamepad_button_check(0, gp_padl) || keyboard_check(ord("A")));
P1DOWN  =  8 * (gamepad_button_check(0, gp_padd) || keyboard_check(ord("S")));

P2RIGHT =  1 *  gamepad_button_check(1, gp_padr) || keyboard_check(ord("L"));
P2UP    =  2 * (gamepad_button_check(1, gp_padu) || keyboard_check(ord("I")));
P2LEFT  =  4 * (gamepad_button_check(1, gp_padl) || keyboard_check(ord("J")));
P2DOWN  =  8 * (gamepad_button_check(1, gp_padd) || keyboard_check(ord("K")));

P1A     = 16 * (gamepad_button_check(0, gp_face1) || keyboard_check(ord("Q")));
P1B     = 32 * (gamepad_button_check(0, gp_face2) || keyboard_check(ord("E")));

P2A     = 16 * (gamepad_button_check(1, gp_face1) || keyboard_check(ord("U")));
P2B     = 32 * (gamepad_button_check(1, gp_face2) || keyboard_check(ord("O")));

P1BITS = P1RIGHT + P1UP + P1LEFT + P1DOWN + P1A + P1B;
P2BITS = P2RIGHT + P2UP + P2LEFT + P2DOWN + P2A + P2B;

P1BITS_TOTAL = 0;
P2BITS_TOTAL = 0;

buttons_enum();

// take lowest of the direction bits
for (var i = 0; i < 4; i++) {
	if (P1BITS & (1 << i)) {
		P1BITS_TOTAL += 1 << i;
		break;
	}
}
// take lowest of button bits
for (var i = 4; i < 6; i++) {
	if (P1BITS & (1 << i)) {
		P1BITS_TOTAL += 1 << i;
		break;
	}
}
// take lowest of the direction bits
for (var i = 0; i < 4; i++) {
	if (P2BITS & (1 << i)) {
		P2BITS_TOTAL += 1 << i;
		break;
	}
}
// take lowest of button bits
for (var i = 4; i < 6; i++) {
	if (P2BITS & (1 << i)) {
		P2BITS_TOTAL += 1 << i;
		break;
	}
}

// check button (finally) (P1)
if (P1BITS_TOTAL == BUTTONBITS.RIGHTA) {
	p1_secretchoice = BUTTON.RIGHTA;
} else if (P1BITS_TOTAL == BUTTONBITS.UPA) {
	p1_secretchoice = BUTTON.UPA;
} else if (P1BITS_TOTAL == BUTTONBITS.LEFTA) {
	p1_secretchoice = BUTTON.LEFTA;
} else if (P1BITS_TOTAL == BUTTONBITS.DOWNA) {
	p1_secretchoice = BUTTON.DOWNA;
} else if (P1BITS_TOTAL == BUTTONBITS.RIGHTB) {
	p1_secretchoice = BUTTON.RIGHTB;
} else if (P1BITS_TOTAL == BUTTONBITS.UPB) {
	p1_secretchoice = BUTTON.UPB;
} else if (P1BITS_TOTAL == BUTTONBITS.LEFTB) {
	p1_secretchoice = BUTTON.LEFTB;
}

// check button (P2)
if (P2BITS_TOTAL == BUTTONBITS.RIGHTA) {
	p2_secretchoice = BUTTON.RIGHTA;
} else if (P2BITS_TOTAL == BUTTONBITS.UPA) {
	p2_secretchoice = BUTTON.UPA;
} else if (P2BITS_TOTAL == BUTTONBITS.LEFTA) {
	p2_secretchoice = BUTTON.LEFTA;
} else if (P2BITS_TOTAL == BUTTONBITS.DOWNA) {
	p2_secretchoice = BUTTON.DOWNA;
} else if (P2BITS_TOTAL == BUTTONBITS.RIGHTB) {
	p2_secretchoice = BUTTON.RIGHTB;
} else if (P2BITS_TOTAL == BUTTONBITS.UPB) {
	p2_secretchoice = BUTTON.UPB;
} else if (P2BITS_TOTAL == BUTTONBITS.LEFTB) {
	p2_secretchoice = BUTTON.LEFTB;
}