/// print debug stuff

draw_text_color( 0, 0, 
	"Debug:\n" +
	"P1BITS: " + string(obj_gamecontrol.P1BITS) + "\n" +
	"P1BTOT: " + string(obj_gamecontrol.P1BITS_TOTAL) + "\n" +
	"P1SECR: " + string(obj_gamecontrol.p1_secretchoice) + "\n" + 
	"P2BITS: " + string(obj_gamecontrol.P2BITS) + "\n" +
	"P2SECR: " + string(obj_gamecontrol.p2_secretchoice) + "\n" 
, c_black, c_black, c_black, c_black, 0.80);