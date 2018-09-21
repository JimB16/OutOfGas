

SECTION "bank3", ROMX, BANK[$3]

data_34000: ; 3:4000

INCBIN "baserom.gb", 16384*3+$0, $3fe7-$0

data_37fe7: ; 3:7fe7
db $0A, $AB, $00, $B0, $00
db $0A, $4B, $01, $50, $01
db $56, $50, $01, $E0, $00
db $0A, $EB, $01, $B0, $00

data_37ffb: ; 3:7ffb
db $00, $26, $01, $BC, $00
