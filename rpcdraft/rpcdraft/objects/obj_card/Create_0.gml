/// init

enum cards {
	ROCK = 0,
	PAPER = 1,
	SCISSORS = 2
}

type = irandom(2)

switch type {
	case cards.SCISSORS:
		sprite_index = spr_card_scissors;
		break;
	case cards.ROCK:
		sprite_index = spr_card_rock;
		break;
	case cards.PAPER:
		sprite_index = spr_card_paper;
		break;
}

