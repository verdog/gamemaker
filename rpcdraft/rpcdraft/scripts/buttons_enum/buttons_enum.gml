/// buttons_enum()

enum BUTTON {
	RIGHTA,
	UPA,
	LEFTA,
	DOWNA,
	RIGHTB,
	UPB,
	LEFTB,
	UNDEF
}

enum BUTTONBITS {
	RIGHTA = 1 + 16,
	UPA    = 2 + 16,
	LEFTA  = 4 + 16,
	DOWNA  = 8 + 16,
	RIGHTB = 1 + 32,
	UPB    = 2 + 32,
	LEFTB  = 4 + 32,
	UNDEF  = 0
}