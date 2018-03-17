/// buttons_jumptocard(card)
// puts a buttons near the passed card

var card = argument0;

var yoffset = 64;

switch player {
	case -1:
		break;
	case 1:
		break;
	case 2:
		yoffset = -yoffset;
		break;	
}

x = card.x + 26;
y = card.y + 26 + yoffset;
