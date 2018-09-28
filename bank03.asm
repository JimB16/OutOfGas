

SECTION "bank3", ROMX, BANK[$3]

Bank3Start: ; 3:4000

INCBIN "baserom.gb", 16384*3+$0, $3fe7-$0

data_37fe7: ; 3:7fe7
	Object $0A, $AB, $B0
	Object $0A, $14B, $150
	Object $56, $150, $E0
	Object $0A, $1EB, $B0

data_37ffb: ; 3:7ffb
	Object $00, $126, $BC
