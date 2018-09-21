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
