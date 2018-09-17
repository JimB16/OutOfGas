
SECTION "Home", ROM0[$150]

_Start: ; 0x150
	call Function12cc
	ld sp, wdfff
	call Function12b4
	ld hl, wc000
	ld bc, $2000
.asm_15f
	ld [hl], $0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_15f

	ld hl, $cf0f
	ld [hl], $1
	inc hl
	ld [hl], $1
	inc hl
	ld [hl], $1
	inc hl
	ld [hl], $1
	ld a, $14
	ld [$ff8e], a
	ld [$ff8f], a
	ld a, $80
	ld [rLCDC], a
	ld a, $83
	ld [$c0b3], a

	ei

	call Function316f
	call Function31b3
	call Function333f
	call Functiond0a
	ld h, h
	ccf
	call Functioneec
	call Functioneec
	call Functioned3
	call Functiond00
	ld b, h
	ccf
	ld a, $80
	call Function31a4
	ld a, $99
	ld [$c0e5], a
	ld a, $3
	ld [$c0e6], a
	ld a, $1
	ld [$c0e8], a
	ld [$c0e9], a
	ld a, $2
	ld [$c0db], a
.asm_1bd
	ld a, $1
	ld [$c10e], a
	call ReadInputs
	call Function59e
	call Function4ff
	ld a, [$c0dd]
	cp $0
	jr nz, .asm_1f1
	ld a, [$c0db]
	cp $b
	jr nc, .asm_1e5
	cp $5
	jr z, .asm_1e5
	cp $7
	jr z, .asm_1e5
	cp $0
	jr nz, .asm_1f1

.asm_1e5
	call Function29e
	call Function163a
	call Function1849
	call Function19ad

.asm_1f1
	ld hl, $c104
	inc [hl]
.asm_1f5
	ld a, [$ff8c]
	and a
	jr z, .asm_1f5
	xor a
	ld [$ff8c], a
	call Function3180
	ld a, [$c10e]
	or a
	jr nz, .asm_1f5
	jr .asm_1bd
; 0x208


INCBIN "baserom.gb", $208, $29e-$208


Function29e: ; 0x29e
	call Function4ff
	ld a, [$cf01]
	inc a
	cp $58
	jr c, .asm_2aa
	xor a

.asm_2aa
	ld [$cf01], a
	xor a
.asm_2ae
	ld [$cee1], a
	ld c, a
	ld b, $0
	xor a
	ld [$c0ca], a
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	or a
	jr z, .asm_2d9
	ld [$cee2], a
	call Function1752
	ld a, [$cee2]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, data_2570
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_2d9
	push de
	jp hl

.asm_2d9
	call Function3180
	ld a, [$cee1]
	inc a
	cp $f
	jr nz, .asm_2ae
	jp Function17d6
; 0x2e7


INCBIN "baserom.gb", $2e7, $4ff-$2e7


Function4ff: ; 0x4ff
	ld hl, $c0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	ld a, [$c0dd]
	cp $0
	jr z, .asm_543
	ld a, $34
	ld [$c0cd], a
	ld a, $3c
	ld [$c0cf], a
	xor a
	ld c, $10
	call Function544
	ld a, $44
	ld [$c0cd], a
	ld a, $3c
	ld [$c0cf], a
	ld a, $1
	ld c, $10
	call Function544
	ld a, $54
	ld [$c0cd], a
	ld a, $3c
	ld [$c0cf], a
	ld a, $2
	ld c, $10
	call Function544
	jp Function17d6

.asm_543
	ret
; 0x544


Function544: ; 0x544
	ld [$c0c7], a
	ld hl, $c0c6
	ld [hl], c
	xor a
	ld [$cee4], a
	ld [$cee6], a
	ld a, [$c0cd]
	ld [$cee3], a
	ld a, [$c0cf]
	ld [$cee5], a
	ld a, [$cee3]
	ld l, a
	ld a, [$cee4]
	ld h, a
	ld a, [$c10f]
	ld e, a
	ld a, [$c110]
	ld d, a
	add hl, de
	ld a, l
	ld [$cee3], a
	ld a, h
	ld [$cee4], a
	ld a, [$cee5]
	ld l, a
	ld a, [$cee6]
	ld h, a
	ld a, [$c111]
	ld e, a
	ld a, [$c112]
	ld d, a
	add hl, de
	ld a, l
	ld [$cee5], a
	ld a, h
	ld [$cee6], a
	ld a, [$c0ca]
	and $80
	ld [$c0ca], a
	call Function15af
	jp Functione41
; 0x59e


Function59e: ; 0x59e
	ld a, [$c0db]
	and a
	jp z, Function71a
	cp $b
	jp nc, .asm_643
	cp $1
	jr z, .asm_5d6
	cp $5
	jr z, .asm_61f
	cp $7
	jp z, Function701
	ld a, $0
	ld [$c0e1], a
	call Function2bc1
	call Function2cea
.asm_5c2
	call Function865
	jp nc, Function6d0
	call Function340f
	ld a, $1
	ld [$c0ea], a
	xor a
	ld [$cf13], a
	jr .asm_5c2

.asm_5d6
	call Functiond5a
	ld a, [$c0e6]
	dec a
	ld [$c0e6], a
	and a
	jp nz, .asm_685
	ld a, $3
	ld [$c0e6], a
	call Function17d6
	call Functiond00
	ld h, [hl]
	ld a, $fa
	push hl
	ret nz
	and a
	jp z, .asm_61a
	call Function31b3
	ld a, $81
	call Function31a4
	ld a, $0
	ld [$c0e1], a
	call Function85f
	jr nc, .asm_61a
	ld a, [$c11f]
	inc a
	ld hl, $c0e9
	sub [hl]
	ld [$c11f], a
	ld a, $1
	ld [hl], a
	jr .asm_685

.asm_61a
	pop hl
	jp _Start

.asm_61e
	ret

.asm_61f
	ld hl, CurInputs
	bit 2, [hl]
	jr nz, .asm_639
	ld a, [$c0de]
	inc a
	cp $ff
	jr nz, .asm_63f
	ld a, [$c0df]
	inc a
	ld [$c0df], a
	cp $69
	jr nz, .asm_61e

.asm_639
	ld a, $1
	ld [$c0db], a
	ret

.asm_63f
	ld [$c0de], a
	ret

.asm_643
	ld a, [$c11f]
	cp $40
	jp nz, .asm_660
	ld a, $81
	call Function31a4
	ld hl, $06c7
	ld a, [hl]
	call Function30f5
	call Function2f7b
	call Function9ba
	jp .asm_61a

.asm_660
	ld a, [$c0e9]
	cp $1
	jr nz, .asm_685
	ld a, [$c0e8]
	cp $1
	jr z, .asm_685
	ld a, $81
	call Function31a4
	ld a, [$c0e8]
	dec a
	ld c, a
	ld b, $0
	ld hl, $06c7
	add hl, bc
	ld a, [hl]
	call Function30f5
	call Function2f7b

.asm_685
	call Function31b3
	xor a
	ld [$c0df], a
	ld a, $9f
	ld [$c0de], a
	call Functiond00
	add [hl]
	ld a, $3e
	add e
	call Function31a4
	call Function2b2b
	call Function1823
	call Function206d
	call Function3180
	call Functiona8a
	call Functionabf
	call Functiond0a
	ld h, h
	dec bc
	ld a, [$c11f]
	and $3
	ld c, a
	ld b, $0
	ld hl, $0cc9
	add hl, bc
	ld a, [hl]
	call Function31a4
	xor a
	ld [$c0db], a
	ret
; 0x6c7


INCBIN "baserom.gb", $6c7, $6d0-$6c7


Function6d0: ; 0x6d0
	call Function31b3
	ld a, [$c11f]
	push af
	ld a, $40
	ld [$c11f], a
	call Functiond0a
	db $f4
	ld a, [bc]
	ld a, $1
	ld [$c0df], a
	ld a, $9a
	ld [$c0de], a
	call Function2dff
	pop af
	ld [$c11f], a
	xor a
	call Function30f5
	ld a, $81
	call Function31a4
	call Function2f7b
	jp Function59e.asm_685
; 0x701


Function701: ; 0x701
	call Function83d
	jr nc, .asm_70e
.asm_706
	ld a, $b
	ld [$c0db], a
	jp Function59e

.asm_70e
	ld hl, HoldInputs
	bit 2, [hl]
	jr nz, .asm_706
	bit 3, [hl]
	jr nz, .asm_706
	ret
; 0x71a


Function71a: ; 0x71a
	ld hl, CurInputs
	bit 3, [hl]
	jr z, .asm_742
	ld hl, HoldInputs
	bit 2, [hl]
	jr z, .asm_731
	ld a, [$c0dd]
	and a
	jr nz, .asm_731
	jp .asm_7b3

.asm_731
	ld a, [$c0dd]
	xor $1
	ld [$c0dd], a
	and a
	jr z, .asm_73f
	jp Function31c4

.asm_73f
	jp Call_ResetAndFullVolume

.asm_742
	ld a, [$c11b]
	and a
	jr z, .asm_789
	ld a, [$c0dd]
	cp $1
	jr z, .asm_789
	ld hl, CurInputs
	bit 2, [hl]
	jr z, .asm_789
	ld hl, HoldInputs
	bit 6, [hl]
	jr z, .asm_789
	ld a, $b
	ld [$c0db], a
	ld hl, HoldInputs
	bit 0, [hl]
	jr nz, .asm_76c
	jp Function803

.asm_76c
	ld a, [$c0e8]
	inc a
	cp $9
	jr nz, .asm_776
	ld a, $1

.asm_776
	ld [$c0e8], a
	dec a
	sla a
	sla a
	sla a
	ld [$c11f], a
	ld a, $1
	ld [$c0e9], a
	ret

.asm_789
	ld a, [$ce95]
	cp $2
	jr nz, .asm_791
	ret

.asm_791
	ld a, [$c104]
	and $3f
	jr nz, .asm_7e8
	ld a, [$c0dd]
	cp $0
	jr nz, .asm_7e8
	ld a, [$c0dc]
	dec a
	daa
	cp $0
	jr nz, .asm_7e5
	ld [$c0dc], a
	ld a, [$ce95]
	cp $2
	jr nz, .asm_7b3
	ret

.asm_7b3
	ld a, $5
	ld [$c0db], a
	xor a
	ld [$c0de], a
	ld [$c0df], a
	ld [$cd4c], a
	ld [$cd4d], a
	ld [$cd4e], a
	ld a, [$c0e5]
	and a
	jr nz, .asm_7db
	ld a, $0
	ld [$c11f], a
	ld a, $1
	ld [$c0e8], a
	ld [$c0e9], a

.asm_7db
	ld a, $15
	call Function31a4
	ld a, $85
	jp Function31a4

.asm_7e5
	ld [$c0dc], a

.asm_7e8
	ld a, [$caf6]
	and a
	jr nz, .asm_802
	ld a, [$ce95]
	cp $2
	jr z, .asm_802
	ld a, $2
	ld [$ce95], a
	call Function803
	ld a, $84
	jp Function31a4

.asm_802
	ret
; 0x803


Function803: ; 0x803
	ld a, [$c11f]
	cp $40
	jr z, .asm_824
	inc a
	ld [$c11f], a
	ld a, [$c0e9]
	inc a
	cp $9
	jr nz, .asm_821
	ld hl, $c0e8
	inc [hl]
	ld e, $20
	call Function2006
	ld a, $1

.asm_821
	ld [$c0e9], a

.asm_824
	ret
; 0x825


INCBIN "baserom.gb", $825, $83d-$825


Function83d: ; 0x83d
	ld a, [$c0de]
	and a
	jr z, .asm_84c
	dec a
	and a
	jr z, .asm_84c
	ld [$c0de], a
	and a
	ret

.asm_84c
	ld a, [$c0df]
	and a
	jr z, .asm_85d
	dec a
	ld [$c0df], a
	ld a, $ff
	ld [$c0de], a
	and a
	ret

.asm_85d
	scf
	ret
; 0x85f


Function85f: ; 0x85f
	call Function2bc1
	call Function2ce0

Function865: ; 0x865
	ld hl, $c0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	ld a, $1
	ld [$c10e], a
	call ReadInputs
	ld a, $4a
	ld [$c0cd], a
	ld a, [$c0e1]
	cp $1
	jr z, .asm_886
	ld a, $a
	ld [$c0cd], a

.asm_886
	ld a, $7
	ld [$c0cf], a
	ld a, [$c104]
	and $10
	jr z, .asm_89e
	xor a
	ld c, $9
	ld a, [$c0ea]
	and a
	jr nz, .asm_89e
	call Function544

.asm_89e
	call Function2c3e
	call Function2b6f
	ld hl, CurInputs
	bit 5, [hl]
	jp nz, .asm_8bb
	bit 4, [hl]
	jr z, .asm_8c6
	ld hl, $c0e1
	ld [hl], $1
	ld hl, $cf13
	inc [hl]
	jr .asm_903

.asm_8bb
	ld hl, $c0e1
	ld [hl], $0
	ld hl, $cf13
	dec [hl]
	jr .asm_903

.asm_8c6
	ld bc, $0000
	ld a, [$cf13]
	ld c, a
	ld a, [$c104]
	and $7
	jr nz, .asm_903
	ld hl, HoldInputs
	bit 7, [hl]
	jr z, .asm_8ee
	ld hl, $cf0f
	add hl, bc
	ld a, [hl]
	cp $2
	jr nc, .asm_8e6
	ld a, $1a

.asm_8e6
	dec a
	call Function9a1
	jr nc, .asm_902
	jr c, .asm_8e6

.asm_8ee
	bit 6, [hl]
	jr z, .asm_903
	ld hl, $cf0f
	add hl, bc
	ld a, [hl]
	cp $19
	jr c, .asm_8fc
	xor a

.asm_8fc
	inc a
	call Function9a1
	jr c, .asm_8fc

.asm_902
	ld [hl], a

.asm_903
	ld hl, CurInputs
	bit 2, [hl]
	jr nz, .asm_91a
	bit 3, [hl]
	jr nz, .asm_91a
	call Function17d6
	call Function3180
	call Function30e2
	jp Function865

.asm_91a
	ld a, [$c0ea]
	and a
	jr nz, .asm_93b
	ld a, [$c0e1]
	cp $0
	jr z, .asm_932
	ld a, [$c0e5]
	sub $1
	daa
	ld [$c0e5], a
	scf
	ret

.asm_932
	xor a
	ld [$c0ea], a
	ld [$c0eb], a
	and a
	ret

.asm_93b
	ld bc, $0001
.asm_93e
	ld hl, data_359f
	add hl, bc
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, [$cf0f]
	add $41
	cp [hl]
	jr nz, .asm_987
	inc hl
	ld a, [$cf10]
	add $41
	cp [hl]
	jr nz, .asm_987
	inc hl
	ld a, [$cf11]
	add $41
	cp [hl]
	jr nz, .asm_987
	inc hl
	ld a, [$cf12]
	add $41
	cp [hl]
	jr nz, .asm_987
	ld a, c
	cp $8
	jr nz, .asm_975
	ld a, $1
	ld [$c11b], a
	xor a

.asm_975
	inc a
	ld [$c0e8], a
	dec a
	add a
	add a
	add a
	ld [$c11f], a
	ld a, $1
	ld [$c0e9], a
	jr .asm_932

.asm_987
	inc bc
	ld a, c
	cp $a
	jr nz, .asm_93e
	call Function33fe
	ld a, $0
	ld [$c0e1], a
	ld a, $1
	ld [$c0eb], a
	xor a
	ld [$c0ea], a
	jp Function865
; 0x9a1


Function9a1: ; 0x9a1
	push hl
	ld hl, $00f3
	cp [hl]
	jr z, .asm_9b7
	inc hl
	cp [hl]
	jr z, .asm_9b7
	inc hl
	cp [hl]
	jr z, .asm_9b7
	inc hl
	cp [hl]
	jr z, .asm_9b7
	pop hl
	and a
	ret

.asm_9b7
	pop hl
	scf
	ret
; 0x9ba


Function9ba: ; 0x9ba
	xor a
	ld [$cf0a], a
	ld hl, $0a48
	ld a, l
	ld [$cf14], a
	ld a, h
	ld [$cf15], a
	ld a, $3
	ld [$cf08], a
	ld a, $2
	ld [$cf09], a
	xor a
	ld [$c0df], a
	ld a, $af
	ld [$c0de], a
	call Functiond00
	xor l
	ld a, $cd
	pop bc
	dec hl
	call Function2ce5
.asm_9e7
	ld a, $1
	ld [$c10e], a
	call Function3180
	call ReadInputs
	call Function83d
	jr nc, .asm_a31
	ld a, [$cf0a]
	and a
	jr nz, .asm_a31
	ld hl, $cf14
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $fe
	jr c, .asm_a17
	cp $ff
	jr z, .asm_a47
	inc hl
	ld a, [hli]
	ld [$c0df], a
	ld a, [hl]
	ld [$cf08], a
	jr .asm_a28

.asm_a17
	ld b, $0
	ld c, a
	push hl
	call Function33f7
	ld hl, $cf08
	inc [hl]
	ld a, $2
	ld [$cf09], a
	pop hl

.asm_a28
	inc hl
	ld a, l
	ld [$cf14], a
	ld a, h
	ld [$cf15], a

.asm_a31
	call Function2c3e
	call Function2b6f
	call Function17d6
	ld hl, $c0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	call Function30e2
	jr .asm_9e7

.asm_a47
	ret
; 0xa48


INCBIN "baserom.gb", $a48, $a8a-$a48


Functiona8a: ; 0xa8a
	xor a
	ld [$c0db], a
	ld a, $45
	ld [$c0dc], a
	ret
; 0xa94


INCBIN "baserom.gb", $a94, $abf-$a94


Functionabf: ; 0xabf
	ld a, $5
	ld [$ccfd], a
	ld [$ccfe], a
	ld a, $69
	ld [$ccff], a
	xor a
	ld [$cd00], a
	ld hl, $cefc
	ld [hl], $fd
	inc hl
	ld [hl], $cc
	ld a, $1
	ld hl, $caf8
	ld bc, $00ff
	jp asm_cee
; 0xae3


INCBIN "baserom.gb", $ae3, $ccd-$ae3


Functionccd: ; 0xccd
	ld hl, VBGMap0
	ld bc, $0400
	ld a, $0
	jr asm_cee

	ld hl, VBGMap1
	ld bc, $0400
	jr asm_cee

	ld hl, VBGMap0
	ld bc, $0400
	jr asm_cee

Functionce7: ; 0xce7
	ld hl, wc000
	ld bc, $00a0
	xor a

asm_cee:
	ld [hl], a
	ld d, h
	ld e, l
	inc de
	dec bc

.asm_cf3
	ld a, b
	or c
	ret z
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	call Function3180
	jp .asm_cf3
; 0xd00


Functiond00: ; 0xd00
	call Functiond5a
	ld a, $1
	ld [$c10c], a
	jr asm_d0d

Functiond0a: ; 0xd0a
	call Functiond5a

asm_d0d:
	ld a, $92
	ld [rLY], a
	call Function12cc
	xor a
	ld [$cef1], a
	ld [rSCX], a
	ld a, [$cf3d]
	ld [rSCY], a
	xor a
	ld [$cf3d], a
	call Functionccd
	call Functionce7
	ld a, $5
	ld [rIE], a
	ld a, $bc
	ld [rTIMA], a
	ld [rTMA], a
	ld a, $4
	ld [rTAC], a
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld bc, $0d44
	push bc
	ld h, d
	ld l, e
	jp hl
; 0xd44


INCBIN "baserom.gb", $d44, $d5a-$d44


Functiond5a: ; 0xd5a
.asm_d5a
	ld a, [$c10b]
	or a
	ret z
	dec a
	ld [$c10b], a
	ld e, a
	ld d, $0
	ld a, [$c10c]
	and a
	jp nz, .asm_d79
	ld hl, data_d9a
	add hl, de
	ld a, [hl]
	ld [rBGP], a
	ld hl, $0d9e
	jr .asm_d83

.asm_d79
	ld hl, $0da2
	add hl, de
	ld a, [hl]
	ld [rBGP], a
	ld hl, $0da6

.asm_d83
	add hl, de
	ld a, [hl]
	ld [rOBP0], a
	ld [rOBP1], a
	ld b, $3
	ld hl, $c103
.asm_d8e
	ld a, [hl]
.asm_d8f
	call Function3180
	cp [hl]
	jr z, .asm_d8f
	dec b
	jr nz, .asm_d8e
	jr .asm_d5a
; 0xd9a

data_d9a:


INCBIN "baserom.gb", $d9a, $e41-$d9a


Functione41: ; 0xe41
	ld bc, $0000
	ld e, $0
	ld a, c
	ld hl, $c0c3
	ld [hl], e
	ld a, [$c0c6]
	ld e, a
	ld d, $0
	ld hl, $c0b5
	add hl, bc
	ld a, [hli]
	ld [MBC1RomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hl]
	ld hl, $c0c7
	add [hl]
	ld e, a
	ld hl, $c0bb
	add hl, bc
	ld a, [hli]
	ld [MBC1RomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hl]
	inc a
	push af
	ld hl, $c0b8
	add hl, bc
	ld a, [hli]
	ld [MBC1RomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c0be
	add hl, bc
	ld a, [hli]
	ld [MBC1RomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	pop af
	ld b, a
	ld a, [$c0c1]
	ld e, a
	ld a, [$c0c2]
	ld d, a
.asm_e98
	ld a, e
	cp $a0
	ret nc
	push bc
	ld a, [$c0ca]
	ld b, a
	ld a, [$c0c9]
	ld c, a
	ld a, [hli]
	bit 6, b
	jr z, .asm_eac
	cpl
	inc a

.asm_eac
	add c
	ld [de], a
	inc de
	ld a, [$c0c8]
	ld c, a
	ld a, [hli]
	bit 5, b
	jr z, .asm_eba
	cpl
	inc a

.asm_eba
	add c
	ld [de], a
	inc de
	ld a, [$c0c3]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	xor b
	ld [de], a
	inc de
	pop bc
	dec b
	jr nz, .asm_e98
	ld hl, $c0c1
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 0xed3


Functioned3: ; 0xed3
	push af
	ld a, $ff
.asm_ed6
	dec a
	push af
	ld a, $ff
.asm_eda
	nop
	nop
	nop
	dec a
	cp $0
	jr nz, .asm_eda
	call Function3180
	pop af
	cp $0
	jr nz, .asm_ed6
	pop af
	ret
; 0xeec


Functioneec: ; 0xeec
	call Functioned3
	call Functioned3
	jp Functioned3
; 0xef5


INCBIN "baserom.gb", $ef5, $f5d-$ef5


Functionf5d: ; 0xf5d
	ld hl, $c10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, h
	ld [$c11d], a
	ld hl, $c111
	ld a, [hli]
	ld h, [hl]
	ld l, a
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, h
	ld [$c11e], a
	ret
; 0xf8a


Functionf8a: ; 0xf8a
	ld a, [$ccfc]
	ld e, a
	ld d, $0
	ld h, d
	ld l, d
	ld a, [$c11e]
.asm_f95
	dec a
	cp $ff
	jr z, .asm_f9d
	add hl, de
	jr .asm_f95

.asm_f9d
	ld de, $c12d
	add hl, de
	ld a, [$c11d]
	ld e, a
	ld d, $0
	add hl, de
	ret
; 0xfa9


Functionfa9: ; 0xfa9
	ld hl, $c121
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [$c120]
	ld [MBC1RomBank], a
	ret
; 0xfbe


INCBIN "baserom.gb", $fbe, $101e-$fbe


Function101e: ; 0x101e
	ld a, b
	cp $0
	jr z, .asm_1088
	cp $1
	jp z, Function10c0
	cp $2
	jr z, .asm_1064
	ld a, [$c10f]
	dec a
	and $1f
	add c
	cp $1f
	jr z, .asm_1039
	jr nc, .asm_103f

.asm_1039
	ld a, [$cd02]
	or a
	jr nz, .asm_104d

.asm_103f
	ld a, [$cd05]
	or a
	jr nz, .asm_1054
	call Function10e4
	jr nz, .asm_1054
.asm_104a
	call Function115e

.asm_104d
	ld a, $1
	ld [$cd02], a
	ld a, c
	ret

.asm_1054
	ld a, [$cd02]
	or a
	ret z
	ld a, [$c10f]
	and $1f
	ret z
	ld c, a
	ld a, $20
	sub c
	ret

.asm_1064
	ld a, [$c10f]
	and $1f
	sub c
	jr c, .asm_1072
	ld a, [$cd02]
	or a
	jr nz, .asm_104d

.asm_1072
	ld a, [$cd05]
	or a
	jr nz, .asm_107d
	call Function10e4
	jr z, .asm_104a

.asm_107d
	ld a, [$cd02]
	or a
	ret z
	ld a, [$c10f]
	and $1f
	ret

.asm_1088
	ld a, [$c111]
	dec a
	and $1f
	add c
	cp $1f
	jr z, .asm_1095
	jr nc, .asm_109b

.asm_1095
	ld a, [$cd01]
	or a
	jr nz, asm_10a9

.asm_109b
	ld a, [$cd26]
	or a
	jr nz, asm_10b0
	call Function10e4
	jr nz, asm_10b0

asm_10a6:
	call Function11c3

asm_10a9:
	ld a, $1
	ld [$cd01], a
	ld a, c
	ret

asm_10b0:
	ld a, [$cd01]
	or a
	ret z
	ld a, [$c111]
	and $1f
	ret z
	ld c, a
	ld a, $20
	sub c
	ret
; 0x10c0


Function10c0: ; 0x10c0
	ld a, [$c111]
	and $1f
	sub c
	jr c, .asm_10ce
	ld a, [$cd01]
	or a
	jr nz, asm_10a9

.asm_10ce
	ld a, [$cd26]
	or a
	jr nz, .asm_10d9
	call Function10e4
	jr z, asm_10a6

.asm_10d9
	ld a, [$cd01]
	or a
	ret z
	ld a, [$c111]
	and $1f
	ret
; 0x10e4


Function10e4: ; 0x10e4
	push bc
	call Functionf5d
	ld a, b
	cp $0
	jr z, .asm_112f
	cp $1
	jr z, .asm_1142
	cp $2
	jr z, .asm_1108
	ld e, $5
	ld a, [$c10f]
	and $1f
	jr z, .asm_10ff
	inc e

.asm_10ff
	ld a, [$c11d]
	add e
	ld [$c11d], a
	jr .asm_110c

.asm_1108
	ld hl, $c11d
	dec [hl]

.asm_110c
	ld b, $4
	ld a, [$c111]
	and $1f
	jr z, .asm_1116
	inc b

.asm_1116
	call Functionf8a
	ld a, [$c12d]
	ld c, a
	ld a, [$ccfc]
	ld e, a
	ld d, $0
.asm_1123
	ld a, [hl]
	cp c
	add hl, de
	dec b
	jr nz, .asm_1123
	pop bc
	ret

	pop bc
	or $1
	ret

.asm_112f
	ld e, $4
	ld a, [$c111]
	and $1f
	jr z, .asm_1139
	inc e

.asm_1139
	ld a, [$c11e]
	add e
	ld [$c11e], a
	jr .asm_1146

.asm_1142
	ld hl, $c11e
	dec [hl]

.asm_1146
	ld b, $5
	ld a, [$c10f]
	and $1f
	jr z, .asm_1150
	inc b

.asm_1150
	call Functionf8a
	ld a, [$c12d]
	ld c, a
.asm_1157
	ld a, [hli]
	cp c
	dec b
	jr nz, .asm_1157
	pop bc
	ret
; 0x115e


Function115e: ; 0x115e
	xor a
	ld hl, $cd05
	ld [hli], a
	ld a, l
	ld [$cd03], a
	ld a, h
	ld [$cd04], a
	push bc
	ld a, b
	cp $2
	jr nz, .asm_1175
	ld hl, $c11d
	dec [hl]

.asm_1175
	ld b, $6
	ld a, [$c111]
	and $1f
	jr z, .asm_117f
	inc b

.asm_117f
	ld c, b
	ld hl, $c11e
	dec [hl]
	call Functionf8a
.asm_1187
	push bc
	ld a, [hl]
	push hl
	call Functionfa9
	push hl
	ld a, [$c11e]
	and $7
	add a
	ld e, a
	ld d, $0
	ld hl, $0f45
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [$c11d]
	and $7
	add a
	add a
	ld l, a
	ld h, $0
	add hl, bc
	pop bc
	call Function1227
	ld hl, $c11e
	inc [hl]
	pop hl
	ld a, [$ccfc]
	ld e, a
	ld d, $0
	add hl, de
	pop bc
	dec b
	jr nz, .asm_1187
	ld a, c
	ld [$cd05], a
	pop bc
	ret
; 0x11c3


Function11c3: ; 0x11c3
	xor a
	ld hl, $cd26
	ld [hli], a
	ld a, l
	ld [$cd03], a
	ld a, h
	ld [$cd04], a
	push bc
	ld a, b
	cp $1
	jr z, .asm_11dc
	ld hl, $c11e
	inc [hl]
	jr .asm_11e0

.asm_11dc
	ld hl, $c11e
	dec [hl]

.asm_11e0
	ld b, $7
	ld a, [$c10f]
	and $1f
	jr z, .asm_11ea
	inc b

.asm_11ea
	ld c, b
	ld hl, $c11d
	dec [hl]
	call Functionf8a
.asm_11f2
	push bc
	ld a, [hli]
	push hl
	call Functionfa9
	push hl
	ld a, [$c11e]
	and $7
	add a
	ld e, a
	ld d, $0
	ld hl, $0f45
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [$c11d]
	and $7
	add a
	add a
	ld l, a
	ld h, $0
	add hl, bc
	pop bc
	call Function1227
	ld hl, $c11d
	inc [hl]
	pop hl
	pop bc
	dec b
	jr nz, .asm_11f2
	ld a, c
	ld [$cd26], a
	pop bc
	ret
; 0x1227


Function1227: ; 0x1227
	ld d, h
	ld e, l
	ld hl, $cd03
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, l
	ld [$cd03], a
	ld a, h
	ld [$cd04], a
	ret
; 0x1240


INCBIN "baserom.gb", $1240, $1277-$1240


ReadInputs: ; 0x1277
	ld a, $20 ; Select Button Keys
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	swap a
	ld b, a

	ld a, $10 ; Select Direction Keys
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	or b
	ld c, a
	ld a, [HoldInputs]
	xor c
	and c
	ld [CurInputs], a
	ld a, c
	ld [HoldInputs], a

	ld a, $30
	ld [rJOYP], a

	ld a, [HoldInputs]
	and $f
	cp $f
	ret nz

	call Functiond5a
	jp _Start
; 0x12b4


Function12b4: ; 0x12b4
	ld c, $80
	ld b, $a
	ld hl, $12c2
.asm_12bb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_12bb
	ret
; 0x12c2


INCBIN "baserom.gb", $12c2, $12cc-$12c2


Function12cc: ; 0x12cc
	ld a, [rIE]
	ld [$ff8d], a

	res 0, a
	ld [rIE], a

.asm_12d4
	ld a, [rLY]
	cp $91
	jr c, .asm_12d4

	ld a, [rLCDC]
	and $7f
	ld [rLCDC], a

	ld a, [$ff8d]
	ld [rIE], a

	ret
; 0x12e5


INCBIN "baserom.gb", $12e5, $15af-$12e5


Function15af: ; 0x15af
	push bc
	ld a, [$c10f]
	add $e0
	ld b, a
	ld a, [$cee3]
	sub b
	add $e5
	ld [$c0c8], a
	ld a, [$c111]
	add $e0
	ld b, a
	ld a, [$cee5]
	sub b
	ld b, a
	ld a, $af
	sub b
	ld [$c0c9], a
	pop bc
	ret
; 0x15d2


INCBIN "baserom.gb", $15d2, $160f-$15d2

Function160f: ; 0x160f
	ret nc
	xor a
	ret
; 0x1612


Function1612: ; 0x1612
	cp l
	ret z
	jr Function160f
; 0x1616


Function1616: ; 0x1616
	ld a, [$c111]
	add e
	ld e, a
	ld a, [$c112]
	adc d
	ld d, a
	ld a, [$cee6]
	cp d
	jr z, .asm_1629
	ret c
	jr .asm_162e

.asm_1629
	ld a, [$cee5]
	cp e
	ret c

.asm_162e
	add hl, de
	ld a, [$cee6]
	cp h
	ld a, [$cee5]
	jr z, Function1612
	jr Function160f
; 0x163a


Function163a: ; 0x163a
	ld hl, $caf3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a

.asm_1641
	ld [$caf5], a
	ld a, [$caf2]
	ld [MBC1RomBank], a
	push hl
	ld a, [hli]
	ld [$ccf6], a
	ld a, [hli]
	ld [$cee3], a
	ld a, [hli]
	ld [$cee4], a
	ld a, [hli]
	ld [$cee5], a
	ld a, [hli]
	ld [$cee6], a
	ld a, [$caf5]
	call Function1732
	jr z, .asm_169f

	ld hl, $cee3
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $ffe0
	add hl, bc
	call Function174c
	jr c, .asm_169f

	ld bc, $00c0
	add hl, bc
	call Function174c
	jr z, .asm_1689
	jr c, .asm_1689

	pop hl
	ret

.asm_1689
	ld de, $ffe0
	ld hl, $00c0
	call Function1616
	jr nz, .asm_169f
	call Function16b6
	jr nc, .asm_169f
	ld a, [$caf5]
	call Function173e

.asm_169f
	pop hl
	ld bc, $0005
	add hl, bc
	ld a, [$caf1]
	ld b, a
	ld a, [$caf5]
	inc a
	cp b
	jp nz, .asm_1641
	ret
; 0x16b1


INCBIN "baserom.gb", $16b1, $16b6-$16b1


Function16b6: ; 0x16b6
	push bc
	ld a, $4
.asm_16b9
	call Function1725
	jr z, .asm_16c8
	ld a, [$cee0]
	inc a
	cp $f
	jr c, .asm_16b9
	pop bc
	ret

.asm_16c8
	ld a, [$cee0]
	ld c, a
	ld b, $0
	ld hl, $cd4b
	add hl, bc
	ld de, $000f
	ld a, $1b
.asm_16d7
	ld [hl], $0
	add hl, de
	dec a
	cp $3
	jr nz, .asm_16d7
	ld a, [$cee0]
	ld c, a
	ld b, $0
	ld hl, $cd4b
	add hl, bc
	ld a, [$ccf6]
	ld [hl], a
	cp $a
	jr c, .asm_1706
	cp $14
	jr nc, .asm_1706
	ld a, [$cee5]
	and a
	add $3
	ld [$cee5], a
	ld a, [$cee6]
	adc $0
	ld [$cee6], a

.asm_1706
	ld hl, $ce0e
	add hl, bc
	ld a, [$caf5]
	ld [hl], a
	call Function1794
	call Function17b5
	ld hl, $cde1
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $cea4
	add hl, bc
	ld a, [$c104]
	ld [hl], a
	scf
	pop bc
	ret
; 0x1725


Function1725: ; 0x1725
	ld [$cee0], a
	ld c, a
	ld b, $0
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	or a
	ret
; 0x1732


Function1732: ; 0x1732
	call Function1744
	bit 0, [hl]
	ret
; 0x1738


Function1738: ; 0x1738
	call Function1744
	ld [hl], $1
	ret
; 0x173e


Function173e: ; 0x173e
	call Function1744
	ld [hl], $2
	ret
; 0x1744


Function1744: ; 0x1744
	ld e, a
	ld d, $0
	ld hl, $caf8
	add hl, de
	ret
; 0x174c


Function174c: ; 0x174c
	ld a, d
	cp h
	ret nz
	ld a, e
	cp l
	ret
; 0x1752


Function1752: ; 0x1752
	ld hl, $cd5a
	add hl, bc
	ld a, [hl]
	ld [$cee3], a
	ld hl, $cd69
	add hl, bc
	ld a, [hl]
	ld [$cee4], a
	ld hl, $cd78
	add hl, bc
	ld a, [hl]
	ld [$cee5], a
	ld hl, $cd87
	add hl, bc
	ld a, [hl]
	ld [$cee6], a
	ret
; 0x1773


INCBIN "baserom.gb", $1773, $1794-$1773


Function1794: ; 0x1794
	ld hl, $cd5a
	add hl, bc
	ld a, [$cee3]
	ld [hl], a
	ld hl, $cd69
	add hl, bc
	ld a, [$cee4]
	ld [hl], a
	ld hl, $cd78
	add hl, bc
	ld a, [$cee5]
	ld [hl], a
	ld hl, $cd87
	add hl, bc
	ld a, [$cee6]
	ld [hl], a
	ret
; 0x17b5


Function17b5: ; 0x17b5
	ld hl, $ce1d
	add hl, bc
	ld a, [$cee3]
	ld [hl], a
	ld hl, $ce2c
	add hl, bc
	ld a, [$cee4]
	ld [hl], a
	ld hl, $ce3b
	add hl, bc
	ld a, [$cee5]
	ld [hl], a
	ld hl, $ce4a
	add hl, bc
	ld a, [$cee6]
	ld [hl], a
	ret
; 0x17d6


Function17d6: ; 0x17d6
	ld hl, $c0c1
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_17dc
	ld a, l
	cp $a0
	jr nc, .asm_17e6
	ld [hl], $0
	inc hl
	jr .asm_17dc

.asm_17e6
	xor a
	ld [$c10d], a
	ret
; 0x17eb


INCBIN "baserom.gb", $17eb, $1823-$17eb


Function1823: ; 0x1823
	ld a, $0
	ld [$cee0], a
.asm_1828
	ld a, [$cee0]
	ld c, a
	ld b, $0
	ld hl, $cd4b
	add hl, bc
	ld de, $000f
	ld a, $1b
.asm_1837
	ld [hl], $0
	add hl, de
	dec a
	jr nz, .asm_1837
	ld a, [$cee0]
	inc a
	ld [$cee0], a
	cp $f
	jr c, .asm_1828
	ret
; 0x1849


Function1849: ; 0x1849
	ld b, $0
	ld d, $0
	ld c, $1
	ld e, $4
	ld e, $4
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	cp $0
	jp z, $1901
	call Function1752
	ld hl, $cd5a
	add hl, de
	ld a, [hl]
	ld [$cee9], a
	ld hl, $cd69
	add hl, de
	ld a, [hl]
	ld [$ceea], a
	ld hl, $cd78
	add hl, de
	ld a, [hl]
	ld [$ceeb], a
	ld hl, $cd87
	add hl, de
	ld a, [hl]
	ld [$ceec], a
	ld a, e
	ld [$cee1], a
	ld hl, $cd4b
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_1901
	call Function1910
	jr nc, .asm_1901
	ld hl, $cd4b
	add hl, bc
	ld a, $0
	ld [hl], a
	ld hl, $cd4b
	add hl, de
	ld a, [hl]
	cp $56
	jr z, .asm_18af
	cp $57
	jr z, .asm_18af
	cp $6
	jr z, .asm_18af
	cp $7
	jr z, .asm_18af
	jr .asm_18b7

.asm_18af
	ld hl, $ce59
	add hl, de
	inc [hl]
	jp .asm_1901

.asm_18b7
	ld hl, $cd4b
	add hl, de
	ld a, [hl]
	sub $a
	ld hl, $caf7
	cp [hl]
	jr z, .asm_18c6
	jr nc, .asm_1901

.asm_18c6
	ld hl, $ce59
	add hl, de
	ld a, [hl]
	cp $0
	jr nz, .asm_1901
	ld [hl], $1
	ld hl, $cd4b
	add hl, de
	ld a, [hl]
	sub $9
	ld hl, $caf7
	cp [hl]
	jr c, .asm_18e1
	ld [$caf7], a

.asm_18e1
	ld a, $10
	call Function205e
	and a
	ld a, [$caf6]
	dec a
	daa
	cp $0
	jr nz, .asm_18f2
	ld a, $0

.asm_18f2
	ld [$caf6], a
	push de
	ld a, $47
	call Function31a4
	ld e, $1
	call Function2006
	pop de

.asm_1901
	inc e
	ld a, $e
	cp e
	jp nc, $1853
	inc c
	ld a, $3
	cp c
	jp nc, $1851
	ret
; 0x1910


Function1910: ; 0x1910
	push bc
	push de
	ld a, [$cee1]
	ld c, a
	ld b, $0
	ld a, $12
	ld [$c0d9], a
	ld a, [$cee9]
	ld hl, $ceea
	ld d, [hl]
	ld hl, $cee3
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	bit 7, a
	ld a, e
	jr z, .asm_1933
	cpl
	inc a

.asm_1933
	cp $9
	jr nc, .asm_19a9
	ld a, $9
	ld [$c0cd], a
	ld a, $0
	ld [$c0ce], a
	ld a, [$c0cd]
	ld l, a
	ld a, [$c0ce]
	ld h, a
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld a, l
	ld [$c0cd], a
	ld a, h
	ld [$c0ce], a
	ld a, [$ceeb]
	ld l, a
	ld a, [$ceec]
	ld h, a
	ld a, [$c0cd]
	ld e, a
	ld a, [$c0ce]
	ld d, a
	add hl, de
	ld a, l
	ld [$ceeb], a
	ld a, h
	ld [$ceec], a
	ld a, [$c0cd]
	ld l, a
	ld a, [$c0ce]
	ld h, a
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld a, l
	ld [$c0cd], a
	ld a, h
	ld [$c0ce], a
	ld hl, $cee5
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ceeb
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function174c
	jr c, .asm_19a9
	ld a, [$c0d9]
	ld c, a
	ld b, $0
	add hl, bc
	call Function174c
	jr nc, .asm_19a9
	pop de
	pop bc
	scf
	ret

.asm_19a9
	pop de
	pop bc
	and a
	ret
; 0x19ad


Function19ad: ; 0x19ad
	ld a, [$ce95]
	cp $0
	ret z
	ld a, [$c0db]
	cp $5
	ret z
	ld hl, $c0f4
	inc [hl]
	ld e, $4
	ld d, $0
	ld a, e
	ld [$cee1], a
	ld b, $0
	ld c, a
	call Function1752
	call Function1dea
	jr nc, .asm_19ee
	ld hl, $cd4b
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $1a39
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .data_19eb
	push de
	ld d, $0
	ld a, [$cee1]
	ld e, a
	jp hl

.data_19eb
	db $cd
	db $74
	db $1e

.asm_19ee
	ld a, [$cee1]
	inc a
	ld e, a
	cp $f
	jp c, $19bf
	ld a, [$c0f5]
	and a
	jr nz, .asm_1a06
	ld a, [$c0f4]
	cp $3c
	ret c
	jr .asm_1a12

.asm_1a06
	ld a, [$c0f4]
	cp $28
	ret c
	xor a
	ld [$c0f5], a
	jr .asm_1a1e

.asm_1a12
	ld a, [$c0f6]
	cp $5
	jr c, .asm_1a1e
	ld a, $1
	ld [$c0f5], a

.asm_1a1e
	xor a
	ld [$c0f6], a
	ld [$c0f4], a
	ret
; 0x1a26


INCBIN "baserom.gb", $1a26, $1dea-$1a26


Function1dea: ; 0x1dea
	push bc
	push de
	ld a, $9
	ld [$c0d9], a
	ld a, [$cee4]
	ld d, a
	ld a, [$cee3]
	ld hl, $cd5a
	sub [hl]
	ld e, a
	ld hl, $cd69
	ld a, d
	sbc [hl]
	bit 7, a
	ld a, e
	jr z, .asm_1e09
	cpl
	inc a

.asm_1e09
	cp $c
	jr nc, .asm_1e2d
	ld a, [$cee6]
	ld d, a
	ld a, [$cee5]
	ld hl, $cd78
	sub [hl]
	ld e, a
	ld hl, $cd87
	ld a, d
	sbc [hl]
	bit 7, a
	ld a, e
	jr z, .asm_1e25
	cpl
	inc a

.asm_1e25
	cp $c
	jr nc, .asm_1e2d
	pop de
	pop bc
	scf
	ret

.asm_1e2d
	pop de
	pop bc
	and a
	ret
; 0x1e31


INCBIN "baserom.gb", $1e31, $2006-$1e31


Function2006: ; 0x2006
	push hl
	push bc
	call Function203c
	ld a, [$c0e2]
	and a
	add e
	daa
	ld [$c0e2], a
	ld a, [$c0e3]
	adc $0
	daa
	ld [$c0e3], a
	call Function2023
	pop bc
	pop hl
	ret
; 0x2023


Function2023: ; 0x2023
	push de
	ld a, [$c0e4]
	ld e, a
	call Function203c
	ld a, [$c0e4]
	cp e
	jr z, .asm_203a
	ld hl, $c0e6
	inc [hl]
	ld a, $4f
	call Function31a4

.asm_203a
	pop de
	ret
; 0x203c


Function203c: ; 0x203c
	push bc
	xor a
	ld [$c0e4], a
	ld hl, $c0e2
	ld a, [hl]
	srl a
	srl a
	srl a
	srl a
	and $f
	cp $5
	jr z, .asm_2057
	jr nc, .asm_2057
	jr .asm_205c

.asm_2057
	ld a, $1
	ld [$c0e4], a

.asm_205c
	pop bc
	ret
; 0x205e


Function205e: ; 0x205e
	push de
	ld e, a
	ld a, [$c0dc]
	and a
	add e
	daa
	jr c, .asm_206b
	ld [$c0dc], a

.asm_206b
	pop de
	ret
; 0x206d


Function206d: ; 0x206d
	ld a, $0
	ld [$ce95], a
	ld a, $96
	ld [$ce77], a
	ld a, $9
	ld [$cd4b], a
	ld a, $1
	ld [$caf7], a
	xor a
	ld [$c0dd], a
	xor a
	ld [wc100], a
	ld [wc101], a
	ld [$c102], a
	ld [$c0f8], a
	ld a, $7
	ld [$c0e0], a
	ret
; 0x2098


INCBIN "baserom.gb", $2098, $2570-$2098


data_2570:


INCBIN "baserom.gb", $2570, $2b2b-$2570


Function2b2b: ; 0x2b2b
	call Function2bc1
	call Function2ce5
	jr .asm_2b39

	call Function2bc1
	call Function2cea

.asm_2b39
	ld a, $1
	ld [$c10e], a
	call Function3180
	call ReadInputs
	ld hl, CurInputs
	bit 3, [hl]
	jr nz, .asm_2b6e
	bit 2, [hl]
	jr nz, .asm_2b6e
	call Function83d
	call Function2c3e
	call Function2b6f
	call Function17d6
	ld hl, $c0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	call Function30e2
	call Function31c0
	jr z, .asm_2b6e
	jp .asm_2b39

.asm_2b6e
	ret
; 0x2b6f


Function2b6f: ; 0x2b6f
	ld bc, $0000
	ld hl, $cd5a
	add hl, bc
	ld a, [hl]
	ld [$c0cd], a
	ld hl, $cd78
	add hl, bc
	ld a, [hl]
	ld [$c0cf], a
	ld a, [$c104]
	and $3
	jr nz, .asm_2ba5
	ld hl, $cdb4
	add hl, bc
	ld a, [hl]
	ld hl, $cd5a
	add hl, bc
	add [hl]
	ld [hl], a
	ld [$c0cd], a
	ld hl, $cdc3
	add hl, bc
	ld a, [hl]
	ld hl, $cd78
	add hl, bc
	add [hl]
	ld [hl], a
	ld [$c0cf], a

.asm_2ba5
	push bc
	ld a, [$c0ca]
	or $80
	ld [$c0ca], a
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	ld c, a
	xor a
	call Function544
	pop bc
	inc bc
	ld a, c
	cp $5
	jp c, $2b72
	ret
; 0x2bc1


Function2bc1: ; 0x2bc1
	xor a
	ld [$cee1], a
	ld a, [$cee1]
	ld c, a
	add a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, $2c20
	add hl, bc
	ld a, [hli]
	ld [$c0cd], a
	ld a, [hli]
	ld [$c0cf], a
	ld a, [hli]
	ld [$c0d1], a
	ld a, [hli]
	ld [$c0d3], a
	ld a, [hli]
	ld [$c0d5], a
	ld a, [$cee1]
	ld c, a
	ld b, $0
	ld hl, $cd4b
	add hl, bc
	ld a, [$c0cd]
	ld [hl], a
	ld hl, $cdb4
	add hl, bc
	ld a, [$c0cf]
	ld [hl], a
	ld hl, $cdc3
	add hl, bc
	ld a, [$c0d1]
	ld [hl], a
	ld hl, $cd5a
	add hl, bc
	ld a, [$c0d3]
	ld [hl], a
	ld hl, $cd78
	add hl, bc
	ld a, [$c0d5]
	ld [hl], a
	inc bc
	ld a, c
	ld [$cee1], a
	cp $5
	jp c, $2bc5
	ret
; 0x2c20


INCBIN "baserom.gb", $2c20, $2c3e-$2c20


Function2c3e: ; 0x2c3e
	ld bc, $0007
	ld hl, $cd5a
	add hl, bc
	ld a, [hl]
	ld [$c0cd], a
	ld hl, $cd78
	add hl, bc
	ld a, [hl]
	ld [$c0cf], a
	ld hl, $cea4
	add hl, bc
	dec [hl]
	jr nz, .asm_2c92
	ld hl, $cdb4
	add hl, bc
	ld a, [hl]
	ld hl, $cea4
	add hl, bc
	ld [hl], a
	ld hl, $cd5a
	add hl, bc
	ld a, [hl]
	push hl
	ld hl, $ce1d
	add hl, bc
	add [hl]
	pop hl
	cp $c3
	jr c, .asm_2c80
	cp $c7
	jr nc, .asm_2c80
	ld hl, $cd4b
	add hl, bc
	ld a, $ff
	ld [hl], a
	jp .asm_2cc4

.asm_2c80
	ld [hl], a
	ld [$c0cd], a
	ld hl, $cdc3
	add hl, bc
	ld a, [hl]
	ld hl, $cd78
	add hl, bc
	add [hl]
	ld [hl], a
	ld [$c0cf], a

.asm_2c92
	ld hl, $cdf0
	add hl, bc
	ld a, [hl]
	ld e, a
	ld a, [$c104]
	and e
	jr nz, .asm_2ca3
	ld hl, $cdd2
	add hl, bc
	inc [hl]

.asm_2ca3
	ld hl, $cde1
	add hl, bc
	ld a, [hl]
	ld e, a
	ld hl, $cdd2
	add hl, bc
	ld a, [hl]
	cp e
	jr c, .asm_2cb3
	xor a
	ld [hl], a

.asm_2cb3
	ld e, a
	push bc
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	cp $fe
	jr z, .asm_2cc3
	ld c, a
	ld a, e
	call Function544

.asm_2cc3
	pop bc

.asm_2cc4
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_2cdf
	ld a, [$c0fe]
	ld l, a
	ld a, [Stack]
	ld h, a
	inc hl
	inc hl
	ld a, [hl]
	cp $fe
	jr z, .asm_2cdf
	call asm_2ced

.asm_2cdf
	ret
; 0x2ce0


Function2ce0: ; 0x2ce0
	ld hl, $2d92
	jr asm_2ced


Function2ce5: ; 0x2ce5
	ld hl, $2d8a
	jr asm_2ced

Function2cea: ; 0x2cea
	ld hl, $2d7c

asm_2ced:
	ld a, l
	ld [$c0fe], a
	ld a, h
	ld [Stack], a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	ld a, $7
	ld [$cee1], a
	ld a, [hli]
	ld [$c0cd], a
	ld a, [hli]
	ld [$c0cf], a
	ld a, [hli]
	ld [$c0d0], a
	ld a, [hli]
	ld [$c0d1], a
	ld a, [hli]
	ld [$c0d2], a
	ld a, [hli]
	ld [$c0d3], a
	ld a, [hli]
	ld [$c0d5], a
	ld a, [hli]
	ld [$c0d4], a
	ld a, [hli]
	ld [$c0d6], a
	ld a, [$cee1]
	ld c, a
	ld b, $0
	ld hl, $cd4b
	add hl, bc
	ld a, [$c0cd]
	ld [hl], a
	ld hl, $cdb4
	add hl, bc
	ld a, [$c0cf]
	ld [hl], a
	ld hl, $cea4
	add hl, bc
	ld [hl], a
	ld hl, $ce1d
	add hl, bc
	ld a, [$c0d0]
	ld [hl], a
	ld hl, $cdc3
	add hl, bc
	ld a, [$c0d1]
	ld [hl], a
	ld hl, $ceb3
	add hl, bc
	ld [hl], a
	ld hl, $ce3b
	add hl, bc
	ld a, [$c0d2]
	ld [hl], a
	ld hl, $cd5a
	add hl, bc
	ld a, [$c0d3]
	ld [hl], a
	ld hl, $cd78
	add hl, bc
	ld a, [$c0d5]
	ld [hl], a
	ld hl, $cde1
	add hl, bc
	ld a, [$c0d4]
	ld [hl], a
	ld hl, $cdf0
	add hl, bc
	ld a, [$c0d6]
	ld [hl], a
	ret
; 0x2d7c


INCBIN "baserom.gb", $2d7c, $2dff-$2d7c


Function2dff: ; 0x2dff
	ld a, $1
	ld [$c10e], a
	call Function3180
	call ReadInputs
	ld hl, CurInputs
	bit 3, [hl]
	jr nz, .asm_2e6c
	bit 2, [hl]
	jr nz, .asm_2e6c
	ld a, [$c0df]
	cp $0
	jr z, .asm_2e52
	ld a, [$c0de]
	and $1
	jr nz, .asm_2e39
	ld c, $1
	ld b, $0
	call Function101e
	ld hl, $c111
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, l
	ld [$c111], a
	ld a, h
	ld [$c112], a

.asm_2e39
	ld a, [$c0de]
	ld c, $1
	ld b, $2
	call Function101e
	ld hl, $c10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	dec hl
	ld a, l
	ld [$c10f], a
	ld a, h
	ld [$c110], a

.asm_2e52
	call Function2e6f
	call Function17d6
	ld hl, $c0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	call Function83d
	jr c, .asm_2e6b
	call Function30e2
	jp Function2dff

.asm_2e6b
	ret

.asm_2e6c
	jp Function31b3
; 0x2e6f


Function2e6f: ; 0x2e6f
	xor a
	ld [$c0ca], a
	ld a, $4b
	ld [$c0cd], a
	ld a, $46
	ld [$c0cf], a
	ld c, $11
	xor a
	call Function544
	ld a, [$ce77]
	dec a
	ld [$ce77], a
	jr nz, .asm_2e99
	ld a, [$cde1]
	add $2
	ld [$cde1], a
	ld a, $6e
	ld [$ce77], a

.asm_2e99
	ld hl, $2f66
	ld b, $0
	ld a, [$cde1]
	ld c, a
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_2ead
	xor a
	ld [$cde1], a
	ld c, a

.asm_2ead
	ld hl, $2f66
	add hl, bc
	ld a, [hli]
	ld [$c0cd], a
	ld a, [hli]
	ld [$c0cf], a
	ld c, $15
	ld a, [$ce77]
	srl a
	srl a
	srl a
	and $7
	ld hl, $2f73
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call Function544
	ld bc, $0000
	call Function1752
	call Function15af
	ld a, $12
	ld [$c0c6], a
	xor a
	ld [$c0c7], a
	call Functione41
	ld bc, $0001
	call Function1752
	call Function15af
	ld a, $13
	ld [$c0c6], a
	ld a, [$c0de]
	srl a
	srl a
	srl a
	and $7
	ld c, a
	ld b, $0
	ld hl, $2f4c
	add hl, bc
	ld a, [hl]
	ld [$c0c7], a
	cp $ff
	jr z, .asm_2f4b
	ld a, [$c0df]
	and a
	jr nz, .asm_2f30
	ld a, [$c0de]
	cp $3f
	jr c, .asm_2f42
	srl a
	srl a
	srl a
	srl a
	and $7
	ld c, a
	ld b, $0
	ld hl, $2f5e
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_2f3f

.asm_2f30
	call Functione41
	ld a, [$c0de]
	and $f
	jr nz, .asm_2f4b
	ld a, $12
	jp Function31a4

.asm_2f3f
	jp Function31b3

.asm_2f42
	cp $3d
	jr nz, .asm_2f4b
	ld a, $13
	call Function31a4

.asm_2f4b
	ret
; 0x2f4c


INCBIN "baserom.gb", $2f4c, $2f7b-$2f4c


Function2f7b: ; 0x2f7b
	ld a, $1
	ld [$c10e], a
	call Function3180
	call ReadInputs
	ld a, [$c0fd]
	cp $0
	ld hl, CurInputs
	bit 2, [hl]
	jr nz, .asm_2fc7
	bit 3, [hl]
	jr nz, .asm_2fc7
	xor a
	ld [$c0ca], a
	ld a, $4b
	ld [$c0cd], a
	ld a, $3f
	ld [$c0cf], a
	call Function313c
	ld a, [hl]
	cp $ff
	jr z, .asm_2fc7
	cp $fe
	jr z, .asm_2fb6
	ld c, a
	inc hl
	ld a, [hl]
	call Function544

.asm_2fb6
	call Function17d6
	ld hl, $c0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	call Function30e2
	jp Function2f7b

.asm_2fc7
	ret
; 0x2fc8


INCBIN "baserom.gb", $2fc8, $30d9-$2fc8


data_30d9:
db 0, 1, 1, 1, 1, 2, 2, 2, 3


Function30e2: ; 0x30e2
	ld hl, $c104
	inc [hl]
.asm_30e6
	ld a, [$ff8c]
	and a
	jr z, .asm_30e6
	xor a
	ld [$ff8c], a
	ld a, [$c10e]
	or a
	jr nz, .asm_30e6
	ret
; 0x30f5


Function30f5: ; 0x30f5
	ld [$c0fd], a
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $2fc8
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hl]
	ld [$c0fb], a
	xor a
	ld [$c0fc], a

	ld a, [$c0fd]
	ld b, $0
	ld c, a
	ld hl, data_30d9
	add hl, bc
	ld a, [hl]
	cp $0
	jr z, .asm_312a
	cp $1
	jr z, .asm_3130
	cp $2
	jr z, .asm_3136
	call Functiond0a
	inc l
	ccf
	ret

.asm_312a
	call Functiond0a
	sub $3e
	ret

.asm_3130
	call Functiond0a
	ld [$c93e], a

.asm_3136
	call Functiond0a
	dec bc
	ccf
	ret
; 0x313c


Function313c: ; 0x313c
	ld a, [$c0fd]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, $2fc8
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $0
	ld a, [$c0fc]
	ld c, a
	add hl, bc
	ld a, [$c0fb]
	dec a
	ld [$c0fb], a
	and a
	jr nz, .asm_316e
	inc hl
	inc hl
	ld a, [$c0fc]
	add $3
	ld [$c0fc], a
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld [$c0fb], a
	dec hl
	dec hl

.asm_316e
	ret
; 0x316f


Function316f: ; 0x316f
	ld a, $0
	ld b, $3e
	ld hl, $ffa0

.asm_3176
	ld [hli], a
	dec b
	jp nz, .asm_3176
	ld a, $47
	ld [$ffa0], a
	ret
; 0x3180


Function3180: ; 0x3180
	push af
	push bc
	push de
	push hl
	ld a, [$ffa1]
	ld b, a
	ld a, [wc105]
	cp b
	jr z, .asm_319f
	ld [$ffa1], a
	ld a, [$4000]
	push af

	ld a, BANK(Function24001)
	ld [MBC1RomBank], a
	call Function24001

	pop af
	ld [MBC1RomBank], a

.asm_319f
	pop hl
	pop de
	pop bc
	pop af
	ret
; 0x31a4


Function31a4: ; 0x31a4
	ld b, a
	ld a, Bank(Function24004)
	ld [MBC1RomBank], a
	ld a, b

	call Function24004

	xor a
	ld [MBC1RomBank], a
	ret
; 0x31b3


Function31b3: ; 0x31b3
	ld a, Bank(Function24007)
	ld [MBC1RomBank], a

	call Function24007

	xor a
	ld [MBC1RomBank], a
	ret
; 0x31c0


Function31c0: ; 0x31c0
	ld a, [$ffb1]
	or a
	ret
; 0x31c4


Function31c4: ; 0x31c4
	ld a, Bank(Function2400a)
	ld [MBC1RomBank], a
	ld a, $54

	call Function2400a

	xor a
	ld [MBC1RomBank], a
	ret
; 0x31d3


Call_ResetAndFullVolume: ; 0x31d3
	ld a, Bank(ResetAndFullVolume)
	ld [MBC1RomBank], a

	call ResetAndFullVolume

	xor a
	ld [MBC1RomBank], a
	ret
; 0x31e0


INCBIN "baserom.gb", $31e0, $3334-$31e0


Function3334: ; 0x3334
	ld hl, $cf2e
	add [hl]
	inc a
	ld hl, $9e40
	add hl, bc
	ld [hl], a
	ret
; 0x333f


Function333f: ; 0x333f
	ld c, $34
	ld a, [$cf2e]
	ld e, a
	ld hl, $9e40
.asm_3348
	ld a, e
	ld [hli], a
	dec c
	ld a, c
	and a
	jr nz, .asm_3348
	ld a, [$c0e8]
	ld bc, $002d
	call Function3334
	ld a, [$c0e9]
	ld bc, $002f
	call Function3334
	ld a, $b
	ld bc, $002e
	call Function3334
	ret
; 0x336a


INCBIN "baserom.gb", $336a, $33f7-$336a


Function33f7: ; 0x33f7
	ld a, $3
	ld hl, $0010
	jr asm_3421

Function33fe: ; 0x33fe
	ld a, $f
	ld [$cf08], a
	ld a, $2
	ld [$cf09], a
	ld bc, $0002
	ld a, $3
	jr asm_341e

Function340f: ; 0x340f
	ld a, $f
	ld [$cf08], a
	ld a, $2
	ld [$cf09], a
	ld bc, $0003
	ld a, $1

asm_341e
	ld hl, data_34c9

asm_3421
	ld [$cf0a], a
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, c
	ld [$cf0b], a
	ld a, b
	ld [$cf0c], a
	ld a, $1
	ld [$c0eb], a
	ret
; 0x3437


INCBIN "baserom.gb", $3437, $34c9-$3437


data_34c9: ; 0x34c9
	dw data_34d1, $34E2, $34E8, $34F9

data_34d1: ; 0x34d1
	db "END     CONTINUE", 0

data_34e2: ; 0x34e2
	db "LEVEL", 0

data_34e8: ; 0x34e8
	db "START   CONTINUE", 0

data_34f9: ; 0x34f9
	db "PASSWORD:       ", 0

data_350a: ; 0x350a
dw $350C

data_350c: ; 0x350c
db "-", 0, "STORYBOARDS", 0, " KEITH ROBINSON", 0, "MUSIC", 0, " DAVE HAYES", 0, "ARRANGED BY", 0, " DAVE WARHOL", 0, " PRODUCED BY", 0, "  DAVE WARHOL", 0, " FOR", 0, "  REALTIME", 0, "  ASSOCIATES", 0, "                 ", 0

data_359f: ; 0x359f
dw data_35b1, data_35bc, data_35c1, data_35c6, data_35cb, data_35d0, data_35d5, data_35da, data_35df

data_35b1: ; 0x35b1
db "PASSWORD: ", 0

data_35bc: ; 0x35bc
db "MNDC", 0

data_35c1: ; 0x35c1
db "MRGT", 0

data_35c6: ; 0x35c6
db "SHPH", 0

data_35cb: ; 0x35cb
db "JMMC", 0

data_35d0: ; 0x35d0
db "DHYS", 0

data_35d5: ; 0x35d5
db "LNRD", 0

data_35da: ; 0x35da
db "DVBN", 0

data_35df: ; 0x35df
db "WRHL", 0

INCBIN "baserom.gb", $35e4, $4000-$35e4
