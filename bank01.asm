

SECTION "bank1", ROMX, BANK[$1]


Bank1Start: ; 1:4000
	db 1


Function14001: ; 1:4001
	ld a, $0
	ld [wc0c3], a

	ld a, [wc0c6]
	add a
	ld e, a
	ld d, $0
	ld hl, SpriteTileNrPtrs
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wc0c7]
	add a
	add a
	add a
	ld e, a
	ld c, $4
	ld b, $0
	add hl, de

	ld a, [wc0c1]
	ld e, a
	ld a, [wc0c2]
	ld d, a
	ld a, e
	cp $a0
	ret nc

	ld a, [wc0ca]
	ld b, a
	ld a, [wc0c9]
	ld c, a
	ld a, $f8
	bit 6, b
	jr z, .asm_403c

	cpl
	inc a

.asm_403c
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $fc
	bit 5, b
	jr z, .asm_404b

	cpl
	inc a

.asm_404b
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	ld a, [wc0c9]
	ld c, a
	ld a, $f8
	bit 6, b
	jr z, .asm_4065
	cpl
	inc a

.asm_4065
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $4
	bit 5, b
	jr z, .asm_4074
	cpl
	inc a

.asm_4074
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	ld a, [wc0c9]
	ld c, a
	ld a, $0
	bit 6, b
	jr z, .asm_408e
	cpl
	inc a

.asm_408e
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $fc
	bit 5, b
	jr z, .asm_409d
	cpl
	inc a

.asm_409d
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	ld a, [wc0c9]
	ld c, a
	ld a, $0
	bit 6, b
	jr z, .asm_40b7
	cpl
	inc a

.asm_40b7
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $4
	bit 5, b
	jr z, .asm_40c6
	cpl
	inc a

.asm_40c6
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hl]
	xor b
	ld [de], a
	inc de
	ld hl, wc0c1
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 0x40db


Function140db: ; 1:40db
	xor a
	ld [wc0c3], a
	ld a, [wc0c6]
	add a
	ld e, a
	ld d, $0
	ld hl, SpriteTileNrPtrs
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0c7]
	add a
	ld e, a
	add hl, de
	ld a, [wc0c1]
	ld e, a
	ld a, [wc0c2]
	ld d, a
	ld a, e
	cp $a0
	ret nc
	ld a, [wc0ca]
	ld b, a
	ld a, [wc0c9]
	ld c, a
	ld a, $fc
	bit 6, b
	jr z, .asm_410f
	cpl
	inc a

.asm_410f
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $fe
	bit 5, b
	jr z, .asm_411e
	cpl
	inc a

.asm_411e
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	ld hl, wc0c1
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 0x4133


Function14133: ; 1:4133
	xor a
	ld [wc0c3], a
	ld a, [wc0c6]
	add a
	ld e, a
	ld d, $0
	ld hl, SpriteTileNrPtrs
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0c7]
	ld e, a
	add a
	add a
	add a
	add a
	add e
	add e
	ld e, a
	add hl, de
	ld a, [wc0c1]
	ld e, a
	ld a, [wc0c2]
	ld d, a
	ld a, e
	cp $a0
	ret nc
	ld bc, $0000
.asm_4160
	push bc
	push hl
	ld hl, data_141be
	add hl, bc
	ld a, [hl]
	pop hl
	push af
	ld a, [wc0c9]
	ld c, a
	ld a, [wc0ca]
	ld b, a
	pop af
	bit 6, b
	jr z, .asm_4178
	cpl
	inc a

.asm_4178
	add c
	ld [de], a
	inc de
	pop bc

	push hl
	ld hl, data_141b5
	add hl, bc
	ld a, [hl]
	pop hl

	push bc
	push af
	ld a, [wc0c8]
	ld c, a
	ld a, [wc0ca]
	ld b, a
	pop af
	bit 5, b
	jr z, .asm_4194
	cpl
	inc a

.asm_4194
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [wc0ca]
	ld b, a
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	pop bc
	ld a, c
	inc a
	ld c, a
	cp $9
	jr nz, .asm_4160
	ld hl, wc0c1
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 0x41b5


data_141b5: ; 1:41b5
db $F6, $FE, $06, $F6, $FE, $06, $F6, $FE, $06

data_141be: ; 1:41be
db $F4, $F4, $F4, $FC, $FC, $FC, $04, $04, $04


Function141c7: ; 1:41c7
	ld a, $0
	ld [wc0c3], a
	ld a, [wc0c6]
	add a
	ld e, a
	ld d, $0
	ld hl, SpriteTileNrPtrs
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0c7]
	ld e, a
	add a
	add a
	add e
	add e
	ld e, a
	ld c, $4
	ld b, $0
	add hl, de
	ld a, [wc0c1]
	ld e, a
	ld a, [wc0c2]
	ld d, a
	ld a, e
	cp $a0
	ret nc
	ld a, [wc0ca]
	ld b, a
	ld a, [wc0c9]
	ld c, a
	ld a, $f8
	bit 6, b
	jr z, .asm_4204
	cpl
	inc a

.asm_4204
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $fa
	bit 5, b
	jr z, .asm_4213
	cpl
	inc a

.asm_4213
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	ld a, [wc0c9]
	ld c, a
	ld a, $f8
	bit 6, b
	jr z, .asm_422d
	cpl
	inc a

.asm_422d
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $2
	bit 5, b
	jr z, .asm_423c
	cpl
	inc a

.asm_423c
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	ld a, [wc0c9]
	ld c, a
	ld a, $f8
	bit 6, b
	jr z, .asm_4256
	cpl
	inc a

.asm_4256
	add c
	ld [de], a
	inc de
	ld a, [wc0c8]
	ld c, a
	ld a, $a
	bit 5, b
	jr z, .asm_4265
	cpl
	inc a

.asm_4265
	add c
	ld [de], a
	inc de
	ld a, [wc0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	ld hl, wc0c1
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 0x427a


Function1427a: ; 1:427a
	ld hl, $cf1a
	ld d, h
	ld e, l
	ld hl, data_14293
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_4287
	ld a, [bc]
	inc bc
	ld [de], a
	cp $0
	jr z, .asm_4292
	inc de
	inc [hl]
	jr .asm_4287

.asm_4292
	ret
; 0x4293


data_14293: ; 1:4293
dw .data_14313, .data_14323, .data_14334, .data_14343, .data_14350, .data_14362, .data_14373, .data_14383
dw .data_14393, .data_143a3, .data_143b1, .data_143bd, .data_143cb, .data_143db, .data_143ed, .data_143fc
dw $440B, $441B, $4428, $4436, $4447, $4455, $4464, $4476
dw $4486, $4494, $44A4, $44B5, $44C4, $44D2, $44E0, $44EF
dw $44FE, $450D, $451C, $452E, $453D, $454B, $4558, $4568
dw $4575, $4587, $4595, $45A9, $45B7, $45C5, $45D3, $45E6
dw $45F5, $4605, $4614, $4624, $4632, $4640, $4650, $4660
dw $466E, $467A, $4689, $4697, $46A7, $46BB, $46CD, $46DF


.data_14313 ; 1:4313
db "  PYRAMID POWER", 0
.data_14323 ; 1:4323
db " EIGHT IS ENOUGH", 0
.data_14334 ; 1:4334
db "   EASY AS PIE", 0
.data_14343 ; 1:4343
db "     ZIG ZAG", 0
.data_14350 ; 1:4350
db "  TANKS VERY MUCH", 0
.data_14362 ; 1:4362
db "  BOTH SIDES NOW", 0
.data_14373 ; 1:4373
db "  SPRINKLER RUN", 0
.data_14383 ; 1:4383
db "  FOUR CHAMBERS", 0
.data_14393 ; 1:4393
db "  HUNT AND PECK", 0
.data_143a3 ; 1:43a3
db "    HEAD RUSH", 0
.data_143b1 ; 1:43b1
db "      EIGER", 0
.data_143bd ; 1:43bd
db "    TIGHTROPE", 0
.data_143cb ; 1:43cb
db " ON YOUR WAY UP", 0
.data_143db ; 1:43db
db "ICY UPS AND DOWNS", 0
.data_143ed ; 1:43ed
db "   CLOVER LEAF", 0
.data_143fc ; 1:43fc
db "   ICE  MINING", 0
db "  STAY ON TRACK", 0
db "     ARENA 4", 0
db "   3 CHAMBERS", 0
db "  ROCKET SCIENCE", 0
db "    FAR FLUNG", 0
db "   DOUBLE BACK", 0
db " GO WITH THE FLOW", 0
db "  TWISTY TUNNEL", 0
db "    MNEUMONIC", 0
db "   ICE CHAMBERS", 0
db "  TOUCH AND GO 2", 0
db "   FAR FLUNG 2", 0
db "    RED ROVER", 0
db "    RUNAROUND", 0
db "    DURL DURL!", 0
db "   SPRINKLERS!", 0
db "    GRAND PRIX", 0
db "   PINBALL WIZ", 0
db " A STITCH IN TIME", 0
db "   SHUTTLE RUN", 0
db "    MAZE CITY", 0
db "     RAFTING", 0
db "   BRAIDED PATH", 0
db "      CHEOPS", 0
db "  CROSSOVER DREAM", 0
db "      BOING!!", 0
db " ULTRA CRISS CROSS!", 0
db "    BRAIDED 2", 0
db "    CATACOMBS", 0
db "    CLOCKWISE", 0
db " AGAINST THE CLOCK", 0
db "   JAIL  BREAK", 0
db "  EVOLUTION 101", 0
db "  DOUBLE HELIX", 0
db "   DOUBLE CROSS", 0
db "    SWIRLPOOL", 0
db "    CROSSFIRE", 0
db "  FOBIDDEN ZONE", 0
db "   STAR SYSTEM ", 0
db "    WATERLOO!", 0
db "       TUT!", 0
db "    HARASSMENT", 0
db "    NETWORK !", 0
db "   TIMED TRAVEL", 0
db "HORROR OF CHAMBERS!", 0
db "  RIGHT TURN ONLY", 0
db "  TRAFFIC SCHOOL!", 0
db "     BANZAI!", 0


SpriteTileNrPtrs: ; 1:46ec
dw .data_14720, .data_14768, .data_1476a, .data_1477a, .data_147da, .data_147e2, .data_1482a, .data_1483a, .data_1484a, .data_1486a, .data_1488a, .data_14892, .data_148da, .data_148dc, .data_148e4, .data_148ec, .data_1497c, .data_14994, .data_149a4, .data_149b4, .data_149d4, .data_149f4, .data_149fa, .data_14a00, .data_14a06, .data_14a12

.data_14720 ; 1:4720
dw $0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $A, $B, $C, $D, $E, $F, $10, $11, $12, $13, $400E, $400F, $400C, $400D, $400A, $400B, $4008, $4009, $4006, $4007, $4004, $4005, $4002, $4003, $4000, $4001

.data_14768 ; 1:4768
dw $14

.data_1476a ; 1:476a
dw $15, $16, $17, $1018, $15, $16, $19, $101A

.data_1477a ; 1:477a
dw $1B, $1C, $1D, $1E, $1F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F, $30, $31, $32, $33, $34, $35, $36, $2F, $30, $31, $32, $2B, $2C, $2D, $2E, $27, $28, $29, $2A, $23, $24, $25, $26, $1F, $20, $21, $22

.data_147da ; 1:47da
dw $37, $38, $4037, $4038

.data_147e2 ; 1:47e2
dw $39, $3A, $3B, $3C, $3D, $3E, $3F, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $43, $44, $4B, $4C, $4D, $44, $4E, $4F, $3B, $3C, $50, $42, $4D, $44, $50, $51, $43, $44

.data_1482a ; 1:482a
dw $52, $53, $54, $55, $56, $57, $58, $59

.data_1483a ; 1:483a
dw $5C, $5A, $5D, $5B, $60, $5E, $61, $5F

.data_1484a ; 1:484a
dw $62, $64, $63, $65, $66, $64, $67, $65, $68, $6A, $69, $6B, $6C, $6E, $6D, $6F

.data_1486a ; 1:486a
dw $71, $70, $73, $72, $75, $74, $73, $72, $77, $76, $79, $78, $7B, $7A, $7D, $7C

.data_1488a ; 1:488a
dw $7E, $7F, $80, $81

.data_14892 ; 1:4892
dw $82, $83, $84, $85, $87, $86, $84, $85, $87, $88, $84, $85, $87, $89, $84, $85, $87, $8B, $84, $8A, $87, $8C, $84, $8D, $87, $8C, $84, $8E, $87, $8C, $84, $8F, $87, $8C, $90, $91

.data_148da ; 1:48da
dw $92

.data_148dc ; 1:48dc
dw $93, $94, $95, $96

.data_148e4 ; 1:48e4
dw $97, $98, $99, $9A

.data_148ec ; 1:48ec
dw $9B, $9D, $37, $9C, $37, $37, $37, $37, $37, $9E, $A0, $37, $9F, $A1, $37, $37, $37, $37, $A2, $A4, $37, $A3, $A5, $37, $37, $37, $37, $A6, $A8, $37, $A7, $A9, $37, $37, $37, $37, $AA, $AC, $AE, $AB, $AD, $AF, $B2, $B1, $B0, $B3, $B5, $B7, $B4, $B6, $B8, $BB, $BA, $B9, $BC, $BE, $C0, $BD, $BF, $C1, $C4, $C3, $C2, $40BB, $40BA, $40B9, $40B4, $40B6, $40B8, $40B3, $40B5, $40B7

.data_1497c ; 1:497c
dw $37, $37, $C5, $C6, $37, $37, $C8, $C7, $37, $37, $CA, $C9

.data_14994 ; 1:4994
dw $CB, $20CB, $40CB, $60CB, $CC, $20CC, $40CC, $60CC

.data_149a4 ; 1:49a4
dw $CD, $20CD, $40CD, $60CD, $CE, $20CE, $40CE, $60CE

.data_149b4 ; 1:49b4
dw $37, $37, $CF, $D0, $37, $37, $D1, $D2, $37, $37, $D3, $D4, $37, $37, $D5, $D6

.data_149d4 ; 1:49d4
dw $37, $D7, $37, $D8, $37, $D9, $37, $DA, $37, $DB, $37, $DC, $37, $DD, $37, $DE

.data_149f4 ; 1:49f4
dw $DF, $E0, $E0

.data_149fa ; 1:49fa
dw $E1, $E0, $E0

.data_14a00 ; 1:4a00
dw $E2, $E0, $E0

.data_14a06 ; 1:4a06
dw $97, $98, $99, $9A, $94, $93

.data_14a12 ; 1:4a12
dw $E3, $E4, $E5, $E6


data_14a1a: ; 1:4a1a
INCBIN "baserom.gb", $4000*1+$a1a, $a5b-$a1a


data_14a5b: ; 1:4a5b

INCBIN "baserom.gb", $4000*1+$a5b, $e6b-$a5b

data_14e6b: ; 1:4e6b

INCBIN "baserom.gb", $4000*1+$e6b, $12bb-$e6b

data_152bb: ; 1:52bb

INCBIN "baserom.gb", $4000*1+$12bb, $171b-$12bb

data_1571b: ; 1:571b

INCBIN "baserom.gb", $4000*1+$171b, $181b-$171b

data_1581b: ; 1:581b

INCBIN "baserom.gb", $4000*1+$181b, $2057-$181b

data_16057: ; 1:6057

INCBIN "baserom.gb", $4000*1+$2057, $2716-$2057

data_16716: ; 1:6716

INCBIN "baserom.gb", $4000*1+$2716, $2eed-$2716

data_16eed: ; 1:6eed

INCBIN "baserom.gb", $4000*1+$2eed, $33f0-$2eed

data_173f0: ; 1:73f0
db $2E, $22, $1C, $15, $0E, $07, $00, $00, $00, $00

data_173fa: ; 1:73fa

INCBIN "baserom.gb", $4000*1+$33fa, $3404-$33fa

data_17404: ; 1:7404

INCBIN "baserom.gb", $4000*1+$3404, $340e-$3404

data_1740e: ; 1:740e

INCBIN "baserom.gb", $4000*1+$340e, $3418-$340e

data_17418: ; 1:7418
INCBIN "build/data/1-1.rle"

data_174b1: ; 1:74b1
INCBIN "build/data/1-2.rle"

data_17568: ; 1:7568
INCBIN "build/data/1-3.rle"

data_17681: ; 1:7681
INCBIN "build/data/1-4.rle"

data_177ac: ; 1:77ac
INCBIN "build/data/1-5.rle"

data_178c2: ; 1:78c2
INCBIN "build/data/1-6.rle"

data_17a5a: ; 1:7a5a
INCBIN "build/data/1-7.rle"

data_17d2e: ; 1:7d2e
INCBIN "build/data/1-8.rle"

data_17fe1: ; 1:7fe1
db $0D, $11

data_17fe3: ; 1:7fe3
db $0D, $0F

data_17fe5: ; 1:7fe5
db $0F, $14

data_17fe7: ; 1:7fe7
db $18, $0F

data_17fe9: ; 1:7fe9
db $0B, $1E

data_17feb: ; 1:7feb
db $0E, $25

data_17fed: ; 1:7fed
db $26, $14

data_17fef: ; 1:7fef
db $18, $23

data_17ff1: ; 1:7ff1
db $0D, $13

data_17ff3: ; 1:7ff3
db $1A, $10

data_17ff5: ; 1:7ff5
db $23, $13

data_17ff7: ; 1:7ff7
db $11, $24

data_17ff9: ; 1:7ff9
db $23, $13

data_17ffb: ; 1:7ffb
db $24, $10

data_17ffd: ; 1:7ffd
db $16, $17


db $ff

