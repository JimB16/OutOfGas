

SECTION "bank1", ROMX, BANK[$1]


Unknown_1_4000: ; 1:4000
	db 1


Function14001: ; 1:4001
	ld a, $0
	ld [wc0c3], a

	ld a, [wc0c6]
	add a
	ld e, a
	ld d, $0
	ld hl, SpriteGraphicPtrs
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
	ld hl, SpriteGraphicPtrs
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
	ld hl, SpriteGraphicPtrs
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
	ld hl, SpriteGraphicPtrs
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
dw .data_14313, .data_14323, $4334, $4343, $4350, $4362, $4373, $4383
dw $4393, $43A3, $43B1, $43BD, $43CB, $43DB, $43ED, $43FC
dw $440B, $441B, $4428, $4436, $4447, $4455, $4464, $4476
dw $4486, $4494, $44A4, $44B5, $44C4, $44D2, $44E0, $44EF
dw $44FE, $450D, $451C, $452E, $453D, $454B, $4558, $4568
dw $4575, $4587, $4595, $45A9, $45B7, $45C5, $45D3, $45E6
dw $45F5, $4605, $4614, $4624, $4632, $4640, $4650, $4660
dw $466E, $467A, $4689, $4697, $46A7, $46BB, $46CD, $46DF


.data_14313 ; 1:4313
db "  PYRAMID POWER", 0

.data_14323 ; 1:4323


INCBIN "baserom.gb", $4000*1+$323, $6ec-$323

SpriteGraphicPtrs: ; 1:46ec
dw $4720, $4768, $476A, $477A, $47DA, $47E2, $482A, $483A, $484A, $486A, $488A, $4892, $48DA, $48DC, $48E4, $48EC, $497C, $4994, $49A4, $49B4, $49D4, $49F4, $49FA, $4A00, $4A06, $4A12

.data_14720 ; 1:4720
dw $0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $A, $B, $C, $D, $E, $F, $10, $11, $12, $13, $400E, $400F, $400C, $400D, $400A, $400B, $4008, $4009, $4006, $4007, $4004, $4005, $4002, $4003, $4000, $4001

.data_14768 ; 1:4768
dw $14

.data_1476a ; 1:476a

INCBIN "baserom.gb", $4000*1+$76a, $a5b-$76a

data_14a5b: ; 1:4a5b

INCBIN "baserom.gb", $4000*1+$a5b, $181b-$a5b

data_1581b: ; 1:581b

INCBIN "baserom.gb", $4000*1+$181b, $33f0-$181b

data_173f0: ; 1:73f0
db $2E, $22, $1C, $15, $0E, $07, $00, $00, $00, $00

data_173fa: ; 1:73fa

INCBIN "baserom.gb", $4000*1+$33fa, $3418-$33fa

data_17418: ; 1:7418
db $81, $19, $47, $1B, $82, $19, $1A, $02, $18, $84, $38, $01, $02, $03, $08, $02, $84, $3B, $1B, $19, $1A, $02, $18, $82, $15, $2B, $09, $36, $85, $2B, $08, $1B, $19, $1A, $02, $18, $82, $2C, $29, $09, $36, $85, $24, $2F, $1B, $19, $1A, $03, $21, $82, $2C, $29, $07, $36, $82, $24, $2F, $02, $21, $82, $19, $1A, $04, $21, $82, $2C, $29, $05, $36, $82, $24, $2F, $03, $21, $82, $19, $1A, $05, $21, $82, $2C, $29, $03, $36, $82, $24, $2F, $04, $21, $82, $18, $19, $02, $1A, $81, $18, $02, $1A, $86, $18, $2C, $29, $2B, $24, $2F, $05, $21, $83, $1A, $21, $18, $02, $19, $02, $1A, $86, $19, $1A, $2C, $25, $2F, $19, $02, $1A, $83, $19, $1A, $18, $02, $21, $82, $18, $19, $02, $1A, $81, $19, $02, $1A, $85, $19, $1A, $0C, $18, $19, $02, $1A, $82, $19, $1A, $12, $14, $FF

data_174b1: ; 1:74b1

INCBIN "baserom.gb", $4000*1+$34b1, $3fe1-$34b1

data_17fe1: ; 1:7fe1
db $0D, $11

data_17fe3: ; 1:7fe3

INCBIN "baserom.gb", $4000*1+$3fe3, $4000-$3fe3

