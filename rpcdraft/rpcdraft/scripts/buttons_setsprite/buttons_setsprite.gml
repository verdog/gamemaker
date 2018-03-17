/// buttons_setsprite(BUTTONS.id)

var bid = argument0;

switch bid {
	case BUTTON.RIGHTA:
		sprite_index = spr_right_a;
	break;
	case BUTTON.UPA:
		sprite_index = spr_up_a;
	break;
	case BUTTON.LEFTA:
		sprite_index = spr_left_a;
	break;
	case BUTTON.DOWNA:
		sprite_index = spr_down_a;
	break;
	case BUTTON.RIGHTB:
		sprite_index = spr_right_b;
	break;
	case BUTTON.UPB:
		sprite_index = spr_up_b;
	break;
	case BUTTON.LEFTB:
		sprite_index = spr_left_b;
	break;
	default:
		sprite_index = spr_arrow;
}