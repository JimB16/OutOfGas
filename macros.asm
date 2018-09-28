farcall: MACRO ; bank, address
	ld a, BANK(\1)
	ld [MBC5RomBank], a
	call \1
	ENDM

romfill: MACRO
INCBIN "baserom.gb",\1,\2 - \1
ENDM

ObjListPtr: MACRO ; address, NrOfObjects
	db BANK(\1)
	db \2
	dw \1
ENDM

Object: MACRO ; KindOfObject, X-Pos, Y-Pos
	db \1
	dw \2, \3
ENDM

BankAddr: MACRO ; address
	dw Bank(\1), \1
ENDM
