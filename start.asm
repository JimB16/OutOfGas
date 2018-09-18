
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

	call Function316f_ResetHRam
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

	ld a, Sound_80
	call FarCall_StartMusic

	ld a, $99
	ld [wc0e5], a
	ld a, $3
	ld [wc0e6], a
	ld a, $1
	ld [wc0e8], a
	ld [SubLevelNr], a
	ld a, $2
	ld [wc0db], a
.asm_1bd
	ld a, $1
	ld [wc10e], a
	call ReadInputs
	call Function59e
	call Function4ff

	ld a, [wc0dd]
	cp $0
	jr nz, .asm_1f1

	ld a, [wc0db]
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
	ld hl, wc104
	inc [hl]
.asm_1f5
	ld a, [hff8c]
	and a
	jr z, .asm_1f5

	xor a
	ld [hff8c], a
	call Function3180
	ld a, [wc10e]
	or a
	jr nz, .asm_1f5

	jr .asm_1bd
; 0x208


Function208: ; 0x208
	push af
	push bc
	push de
	push hl
	ld a, [$4000]
	ld [$cef2], a
	call $ff80
	ld hl, $cef1
	bit 1, [hl]
	jr z, .asm_230
	ld a, [wc10f]
	ld [rSCX], a
	ld a, $80
	ld hl, $c111
	sub [hl]
	ld [rSCY], a
	ld hl, rLCDC
	res 3, [hl]
	set 1, [hl]

.asm_230
	call Function1240
	ld a, [$c0eb]
	and a
	jr z, .asm_23c
	call Function336a

.asm_23c
	call Function3280
	ld a, [$cef2]
	ld [MBC1RomBank], a
	ld hl, wc103
	inc [hl]
	ld hl, hff8c
	inc [hl]
	ld a, [wc10e]
	dec a
	cp $ff
	jr z, .asm_258
	ld [wc10e], a

.asm_258
	pop hl
	pop de
	pop bc
	pop af
	reti
; 0x25d


Function25d: ; 0x25d
	push af
	push hl
	ld a, $b
.asm_261
	dec a
	jr nz, .asm_261
	xor a
	ld a, [$c11a]
	ld [rSCY], a
	xor a
	ld [rSCX], a
	ld hl, rLCDC
	set 3, [hl]
	res 1, [hl]
	ld a, [$ce95]
	cp $0
	jr z, .asm_292
	ld a, [wc105]
	and $3
	jr nz, .asm_292
	ld hl, rLYC
	ld a, [$c0b4]
	cp [hl]
	jr z, .asm_292
	jr nc, .asm_292
	dec [hl]
	ld hl, $c11a
	inc [hl]

.asm_292
	pop hl
	pop af
	reti
; 0x295


Function295: ; 0x295
	push af
	push hl
	ld hl, wc105
	inc [hl]
	pop hl
	pop af
	reti
; 0x29e


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
	ld [wc0ca], a
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


Function2e7: ; 0x2e7
.asm_2e7
	ld hl, hCurInputs
	bit 3, [hl]
	jr z, .asm_2e7
	ret
; 0x2ef


Function2ef: ; 0x2ef
	push hl
	push de
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
; 0x2f9


Function2f9: ; 0x2f9
	xor $ff
	add $1
	ret
; 0x2fe


Function2fe: ; 0x2fe
	push bc
	xor a
	ld [$cf00], a
	ld hl, $cef3
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function174c
	jr c, .asm_327
	push bc
	ld bc, $00a0
	add hl, bc
	pop bc
	call Function174c
	jr nc, .asm_327
	ld hl, $cee3
	ld [hl], e
	inc hl
	ld [hl], d
	jr .asm_32c

.asm_327
	ld a, $1
	ld [$cf00], a

.asm_32c
	ld hl, $cef5
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c111
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function174c
	jr c, .asm_350
	push bc
	ld bc, $0080
	add hl, bc
	pop bc
	call Function174c
	jr nc, .asm_350
	ld hl, $cee5
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	ret

.asm_350
	ld a, $1
	ld [$cf00], a
	pop bc
	ret
; 0x357


Function357: ; 0x357
	push bc
	call Function4dd
	jr nc, .asm_360
	jp .asm_4b3

.asm_360
	ld a, $18
	jr .asm_397

.asm_364
	push bc
	call Function4dd
	jr nc, .asm_36d
	jp .asm_4b3

.asm_36d
	push bc
	ld a, [$ce95]
	cp $1
	jr nz, .asm_37a
	ld a, $d
	call FarCall_StartMusic

.asm_37a
	pop bc
	ld a, $1a
	jr .asm_397

	push bc
	call Function4dd
	jr nc, .asm_388
	jp .asm_4b3

.asm_388
	ld a, $19
	jr .asm_397

.asm_38c
	push bc
	call Function4e3
	jr nc, .asm_395
	jp .asm_4b3

.asm_395
	ld a, $1

.asm_397
	ld hl, $cd4b
	add hl, bc
	ld [hl], a
	ld e, a
	ld a, c
	ld [$cee0], a
	ld a, [$cee1]
	ld c, a
	ld b, $0
	ld a, e
	cp $18
	jr z, .asm_3ce
	ld hl, $ce86
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, $04b5
	call Function2ef
	ld [wc0d9], a
	ld hl, $ce86
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, $04c5
	call Function2ef
	ld [$c0da], a
	jr .asm_3f8

.asm_3ce
	ld hl, $ce86
	add hl, bc
	ld a, [hl]
	and $f
	srl a
	srl a
	ld hl, $04d5
	call Function2ef
	ld [wc0d9], a
	ld hl, $ce86
	add hl, bc
	ld a, [hl]
	and $f
	srl a
	srl a
	ld hl, $04d9
	call Function2ef
	ld [$c0da], a
	jr .asm_3f8

.asm_3f8
	ld hl, $cd5a
	add hl, bc
	ld a, [hl]
	ld [wc0cd], a
	ld hl, $cd69
	add hl, bc
	ld a, [hl]
	ld [wc0cf], a
	ld hl, $cd78
	add hl, bc
	ld a, [hl]
	ld [$c0d1], a
	ld hl, $cd87
	add hl, bc
	ld a, [hl]
	ld [$c0d3], a
	ld a, [$cee0]
	ld c, a
	ld b, $0
	ld a, [wc0d9]
	ld e, $0
	bit 7, a
	jr z, .asm_428
	dec e

.asm_428
	ld hl, wc0cd
	and a
	add [hl]
	ld [$cee9], a
	ld a, [wc0cf]
	adc e
	ld [$ceea], a
	ld hl, $cd5a
	add hl, bc
	ld a, [$cee9]
	ld [hl], a
	ld hl, $cd69
	add hl, bc
	ld a, [$ceea]
	ld [hl], a
	ld a, [$c0da]
	ld e, $0
	bit 7, a
	jr z, .asm_451
	dec e

.asm_451
	ld hl, $c0d1
	and a
	add [hl]
	ld [$ceeb], a
	ld a, [$c0d3]
	adc e
	ld [$ceec], a
	ld hl, $cd78
	add hl, bc
	ld a, [$ceeb]
	ld [hl], a
	ld hl, $cd87
	add hl, bc
	ld a, [$ceec]
	ld [hl], a
	ld a, [$cee1]
	ld c, a
	ld b, $0
	ld hl, $ce86
	add hl, bc
	ld a, [hl]
	and $f
	ld [wc0cd], a
	ld b, $0
	ld a, [$cee0]
	ld c, a
	ld a, [wc0cd]
	ld hl, $22b6
	call Function2ef
	ld hl, $cdb4
	add hl, bc
	ld [hl], a
	ld a, [wc0cd]
	ld hl, $22c6
	call Function2ef
	ld hl, $cdc3
	add hl, bc
	ld [hl], a
	ld a, [wc0cd]
	and $f
	ld hl, $ce86
	add hl, bc
	ld [hl], a
	ld hl, $ce77
	add hl, bc
	ld a, $3c
	ld [hl], a

.asm_4b3
	pop bc
	ret
; 0x4b5


INCBIN "baserom.gb", $4b5, $4dd-$4b5


Function4dd: ; 0x4dd
	ld c, $4
	ld a, $e
	jr Function4e3.asm_4e7

Function4e3: ; 0x4e3
	ld c, $1
	ld a, $3

.asm_4e7
	ld [$c0d5], a
	ld b, $0
.asm_4ec
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4fd
	inc c
	ld a, [$c0d5]
	cp c
	jr nc, .asm_4ec
	scf
	ret

.asm_4fd
	and a
	ret
; 0x4ff


Function4ff: ; 0x4ff
	ld hl, wc0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	ld a, [wc0dd]
	cp $0
	jr z, .asm_543
	ld a, $34
	ld [wc0cd], a
	ld a, $3c
	ld [wc0cf], a
	xor a
	ld c, $10
	call Function544
	ld a, $44
	ld [wc0cd], a
	ld a, $3c
	ld [wc0cf], a
	ld a, $1
	ld c, $10
	call Function544
	ld a, $54
	ld [wc0cd], a
	ld a, $3c
	ld [wc0cf], a
	ld a, $2
	ld c, $10
	call Function544
	jp Function17d6

.asm_543
	ret
; 0x544


Function544: ; 0x544
	ld [wc0c7], a
	ld hl, wc0c6
	ld [hl], c
	xor a
	ld [$cee4], a
	ld [$cee6], a
	ld a, [wc0cd]
	ld [$cee3], a
	ld a, [wc0cf]
	ld [$cee5], a
	ld a, [$cee3]
	ld l, a
	ld a, [$cee4]
	ld h, a
	ld a, [wc10f]
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
	ld a, [wc0ca]
	and $80
	ld [wc0ca], a
	call Function15af
	jp Functione41
; 0x59e


Function59e: ; 0x59e
	ld a, [wc0db]
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
	ld [wc0e1], a
	call Function2bc1
	call Function2cea
.asm_5c2
	call Function865
	jp nc, Function6d0
	call Function340f
	ld a, $1
	ld [wc0ea], a
	xor a
	ld [$cf13], a
	jr .asm_5c2

.asm_5d6
	call Functiond5a
	ld a, [wc0e6]
	dec a
	ld [wc0e6], a
	and a
	jp nz, .asm_685

	ld a, $3
	ld [wc0e6], a
	call Function17d6
	call Functiond00
	ld h, [hl]
	ld a, $fa
	push hl
	ret nz
	and a
	jp z, .asm_61a

	call Function31b3
	ld a, Sound_81
	call FarCall_StartMusic
	ld a, $0
	ld [wc0e1], a
	call Function85f
	jr nc, .asm_61a

	ld a, [wLevelNr]
	inc a
	ld hl, SubLevelNr
	sub [hl]
	ld [wLevelNr], a
	ld a, $1
	ld [hl], a
	jr .asm_685

.asm_61a
	pop hl
	jp _Start

.asm_61e
	ret

.asm_61f
	ld hl, hCurInputs
	bit 2, [hl]
	jr nz, .asm_639

	ld a, [wc0de]
	inc a
	cp $ff
	jr nz, .asm_63f

	ld a, [wc0df]
	inc a
	ld [wc0df], a
	cp $69
	jr nz, .asm_61e

.asm_639
	ld a, $1
	ld [wc0db], a
	ret

.asm_63f
	ld [wc0de], a
	ret

.asm_643
	ld a, [wLevelNr]
	cp MaxLevelNr
	jp nz, .asm_660

	ld a, Sound_81
	call FarCall_StartMusic

	ld hl, data_6c7
	ld a, [hl]
	call Function30f5
	call Function2f7b
	call Function9ba
	jp .asm_61a

.asm_660
	ld a, [SubLevelNr]
	cp $1
	jr nz, .asm_685
	ld a, [wc0e8]
	cp $1
	jr z, .asm_685
	ld a, Sound_81
	call FarCall_StartMusic
	ld a, [wc0e8]
	dec a
	ld c, a
	ld b, $0
	ld hl, data_6c7
	add hl, bc
	ld a, [hl]
	call Function30f5
	call Function2f7b

.asm_685
	call Function31b3
	xor a
	ld [wc0df], a
	ld a, $9f
	ld [wc0de], a
	call Functiond00
	add [hl]
	ld a, Sound_3e
	add e
	call FarCall_StartMusic
	call Function2b2b
	call Function1823
	call Function206d
	call Function3180
	call Functiona8a
	call Functionabf
	call Functiond0a
	ld h, h
	dec bc

	ld a, [wLevelNr]
	and $3
	ld c, a
	ld b, $0
	ld hl, BGMLoopOrder
	add hl, bc
	ld a, [hl]
	call FarCall_StartMusic

	xor a
	ld [wc0db], a

	ret
; 0x6c7


data_6c7: ; 0x6c7
db 8, 5, 6, 7, 3, 4, 1, 2, 8


Function6d0: ; 0x6d0
	call Function31b3
	ld a, [wLevelNr]
	push af

	ld a, MaxLevelNr
	ld [wLevelNr], a
	call Functiond0a
	db $f4
	ld a, [bc]
	ld a, $1
	ld [wc0df], a
	ld a, $9a
	ld [wc0de], a
	call Function2dff

	pop af
	ld [wLevelNr], a
	xor a
	call Function30f5
	ld a, Sound_81
	call FarCall_StartMusic
	call Function2f7b
	jp Function59e.asm_685
; 0x701


Function701: ; 0x701
	call Function83d
	jr nc, .asm_70e
.asm_706
	ld a, $b
	ld [wc0db], a
	jp Function59e

.asm_70e
	ld hl, hHoldInputs
	bit 2, [hl]
	jr nz, .asm_706
	bit 3, [hl]
	jr nz, .asm_706
	ret
; 0x71a


Function71a: ; 0x71a
	ld hl, hCurInputs
	bit 3, [hl]
	jr z, .asm_742
	ld hl, hHoldInputs
	bit 2, [hl]
	jr z, .asm_731
	ld a, [wc0dd]
	and a
	jr nz, .asm_731
	jp .asm_7b3

.asm_731
	ld a, [wc0dd]
	xor $1
	ld [wc0dd], a
	and a
	jr z, .asm_73f
	jp Function31c4

.asm_73f
	jp Call_ResetAndFullVolume

.asm_742
	ld a, [$c11b]
	and a
	jr z, .asm_789
	ld a, [wc0dd]
	cp $1
	jr z, .asm_789
	ld hl, hCurInputs
	bit 2, [hl]
	jr z, .asm_789
	ld hl, hHoldInputs
	bit 6, [hl]
	jr z, .asm_789
	ld a, $b
	ld [wc0db], a
	ld hl, hHoldInputs
	bit 0, [hl]
	jr nz, .asm_76c
	jp IncreaseLevelNr

.asm_76c
	ld a, [wc0e8]
	inc a
	cp $9
	jr nz, .asm_776
	ld a, $1

.asm_776
	ld [wc0e8], a
	dec a
	sla a
	sla a
	sla a
	ld [wLevelNr], a
	ld a, $1
	ld [SubLevelNr], a
	ret

.asm_789
	ld a, [$ce95]
	cp $2
	jr nz, .asm_791
	ret

.asm_791
	ld a, [wc104]
	and $3f
	jr nz, .asm_7e8
	ld a, [wc0dd]
	cp $0
	jr nz, .asm_7e8
	ld a, [wc0dc]
	dec a
	daa
	cp $0
	jr nz, .asm_7e5
	ld [wc0dc], a
	ld a, [$ce95]
	cp $2
	jr nz, .asm_7b3
	ret

.asm_7b3
	ld a, $5
	ld [wc0db], a
	xor a
	ld [wc0de], a
	ld [wc0df], a
	ld [$cd4c], a
	ld [$cd4d], a
	ld [$cd4e], a
	ld a, [wc0e5]
	and a
	jr nz, .asm_7db
	ld a, $0
	ld [wLevelNr], a
	ld a, $1
	ld [wc0e8], a
	ld [SubLevelNr], a

.asm_7db
	ld a, Sound_15
	call FarCall_StartMusic
	ld a, Sound_85
	jp FarCall_StartMusic

.asm_7e5
	ld [wc0dc], a

.asm_7e8
	ld a, [wcaf6]
	and a
	jr nz, .asm_802
	ld a, [$ce95]
	cp $2
	jr z, .asm_802
	ld a, $2
	ld [$ce95], a
	call IncreaseLevelNr
	ld a, Sound_84
	jp FarCall_StartMusic

.asm_802
	ret
; 0x803


IncreaseLevelNr: ; 0x803
	ld a, [wLevelNr]
	cp MaxLevelNr
	jr z, .asm_824

	inc a
	ld [wLevelNr], a

	ld a, [SubLevelNr]
	inc a
	cp $9
	jr nz, .asm_821

	ld hl, wc0e8
	inc [hl]
	ld e, $20
	call Function2006
	ld a, $1

.asm_821
	ld [SubLevelNr], a

.asm_824
	ret
; 0x825


Function825: ; 0x825
	ld a, [wLevelNr]
	dec a
	ld [wLevelNr], a
	ld a, [SubLevelNr]
	dec a
	and a
	jr nz, .asm_839
	ld hl, wc0e8
	dec [hl]
	ld a, $8

.asm_839
	ld [SubLevelNr], a
	ret
; 0x83d


Function83d: ; 0x83d
	ld a, [wc0de]
	and a
	jr z, .asm_84c
	dec a
	and a
	jr z, .asm_84c
	ld [wc0de], a
	and a
	ret

.asm_84c
	ld a, [wc0df]
	and a
	jr z, .asm_85d
	dec a
	ld [wc0df], a
	ld a, $ff
	ld [wc0de], a
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
	ld hl, wc0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	ld a, $1
	ld [wc10e], a
	call ReadInputs
	ld a, $4a
	ld [wc0cd], a
	ld a, [wc0e1]
	cp $1
	jr z, .asm_886
	ld a, $a
	ld [wc0cd], a

.asm_886
	ld a, $7
	ld [wc0cf], a
	ld a, [wc104]
	and $10
	jr z, .asm_89e
	xor a
	ld c, $9
	ld a, [wc0ea]
	and a
	jr nz, .asm_89e
	call Function544

.asm_89e
	call Function2c3e
	call Function2b6f
	ld hl, hCurInputs
	bit 5, [hl]
	jp nz, .asm_8bb
	bit 4, [hl]
	jr z, .asm_8c6
	ld hl, wc0e1
	ld [hl], $1
	ld hl, $cf13
	inc [hl]
	jr .asm_903

.asm_8bb
	ld hl, wc0e1
	ld [hl], $0
	ld hl, $cf13
	dec [hl]
	jr .asm_903

.asm_8c6
	ld bc, $0000
	ld a, [$cf13]
	ld c, a
	ld a, [wc104]
	and $7
	jr nz, .asm_903
	ld hl, hHoldInputs
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
	ld hl, hCurInputs
	bit 2, [hl]
	jr nz, .asm_91a
	bit 3, [hl]
	jr nz, .asm_91a
	call Function17d6
	call Function3180
	call Function30e2
	jp Function865

.asm_91a
	ld a, [wc0ea]
	and a
	jr nz, .checkPassword
	ld a, [wc0e1]
	cp $0
	jr z, .asm_932
	ld a, [wc0e5]
	sub $1
	daa
	ld [wc0e5], a
	scf
	ret

.asm_932
	xor a
	ld [wc0ea], a
	ld [$c0eb], a
	and a
	ret

.checkPassword
	ld bc, $0001
.passwordLoop
	ld hl, PasswordStrings
	add hl, bc
	add hl, bc
	ld a, [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, [$cf0f]
	add $41
	cp [hl]
	jr nz, .checkNextPassword

	inc hl
	ld a, [$cf10]
	add $41
	cp [hl]
	jr nz, .checkNextPassword

	inc hl
	ld a, [$cf11]
	add $41
	cp [hl]
	jr nz, .checkNextPassword

	inc hl
	ld a, [$cf12]
	add $41
	cp [hl]
	jr nz, .checkNextPassword

	ld a, c
	cp $8
	jr nz, .asm_975

	ld a, $1
	ld [$c11b], a

	xor a
.asm_975
	inc a
	ld [wc0e8], a
	dec a
	add a ; *2
	add a ; *4
	add a ; *8
	ld [wLevelNr], a

	ld a, $1
	ld [SubLevelNr], a
	jr .asm_932

.checkNextPassword
	inc bc
	ld a, c
	cp $a
	jr nz, .passwordLoop

	call Function33fe
	ld a, $0
	ld [wc0e1], a
	ld a, $1
	ld [$c0eb], a
	xor a
	ld [wc0ea], a
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
	ld hl, data_a48
	ld a, l
	ld [$cf14], a
	ld a, h
	ld [$cf15], a
	ld a, $3
	ld [$cf08], a
	ld a, $2
	ld [$cf09], a
	xor a
	ld [wc0df], a
	ld a, $af
	ld [wc0de], a
	call Functiond00
	xor l
	ld a, $cd
	pop bc
	dec hl
	call Function2ce5
.asm_9e7
	ld a, $1
	ld [wc10e], a
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
	ld [wc0df], a
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
	ld hl, wc0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	call Function30e2
	jr .asm_9e7

.asm_a47
	ret
; 0xa48


data_a48: ; 0xa48
INCBIN "baserom.gb", $a48, $a8a-$a48


Functiona8a: ; 0xa8a
	xor a
	ld [wc0db], a
	ld a, $45
	ld [wc0dc], a
	ret
; 0xa94


Functiona94: ; 0xa94
	push bc
	call Function15d9
	pop bc
	jr z, .asm_abe
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	cp $15
	jr nc, .asm_ab0
	cp $9
	jr c, .asm_ab0
	ld hl, $ce59
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_abe

.asm_ab0
	ld hl, $cd4b
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $ce0e
	add hl, bc
	ld a, [hl]
	call Function1738

.asm_abe
	ret
; 0xabf


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


Functionae3: ; 0xae3
	ret
; 0xae4


Functionae4: ; 0xae4
	ld hl, $caf8
	ld c, $ff
.asm_ae9
	ld a, [hl]
	cp $2
	jr nz, .asm_aef
	dec a

.asm_aef
	ld [hli], a
	dec c
	jr nz, .asm_ae9
	ret
; 0xaf4


Functionaf4: ; 0xaf4
	xor a
	ld [wc10c], a
	ld a, $8f
	ld [$c0b4], a
	call Functionb64.asm_b76
	ld hl, wc10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $ff
	ld c, $b9
	add hl, bc
	ld a, l
	ld [$cee3], a
	ld a, h
	ld [$cee4], a
	ld hl, $c111
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $0
	ld c, $86
	add hl, bc
	ld a, l
	ld [$cee5], a
	ld a, h
	ld [$cee6], a
	ld bc, $0000
	call Function1794
	ld hl, wc10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $ff
	ld c, $bc
	add hl, bc
	ld a, l
	ld [$cee3], a
	ld a, h
	ld [$cee4], a
	ld hl, $c111
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $0
	ld c, $86
	add hl, bc
	ld a, l
	ld [$cee5], a
	ld a, h
	ld [$cee6], a
	ld bc, $0001
	call Function1794
	ld a, $64
	ld [$ce77], a
	xor a
	ld [$cde1], a
	jp Function2e6f
; 0xb64


Functionb64: ; 0xb64
	ld a, $1
	ld [$cf38], a
	xor a
	ld [wc10c], a
	ld a, $7f
	ld [$c0b4], a
	xor a
	ld [$c11a], a

.asm_b76
	call Function31b3
	ld b, $0
	ld a, [wLevelNr]
	add a
	and a
	add a
	jr nc, .asm_b84
	inc b

.asm_b84
	ld c, a
	push bc
	ld hl, $3bba
	add hl, bc
	ld a, [hli]
	ld [MBC1RomBank], a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	inc a
	ld [$ccfb], a
	ld a, [hli]
	inc a
	ld [$ccfc], a
	ld hl, $3ab6
	add hl, bc
	ld a, [hli]
	ld [MBC1RomBank], a
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	call Function13d7
	pop bc
	ld hl, $3cbe
	add hl, bc
	ld a, [hli]
	ld [wcaf2], a
	ld a, [hli]
	ld [wcaf1], a
	ld a, [hli]
	ld [$caf3], a
	ld a, [hl]
	ld [$caf4], a
	ld hl, $39b2
	add hl, bc
	ld a, [hli]
	push bc
	ld [MBC1RomBank], a
	ld de, $c123
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $000a
	call asm_cee.asm_cf3
	pop bc
	ld hl, $37aa
	add hl, bc
	ld a, [hli]
	ld [wc120], a
	inc hl
	ld a, [hli]
	ld [$c121], a
	ld a, [hl]
	ld [$c122], a
	ld h, b
	ld l, c
	ld de, $38ae
	call Function141c
	ld a, $e9
	ld [$c0ac], a
	ld [$c0c5], a
	call Function12e5
	ld hl, $cefc
	ld a, [hli]
	or [hl]
	ld hl, $cefc
	ld [hl], $20
	inc hl
	ld [hl], $0
	ld a, [$ccfc]
	ld e, a
	ld d, $0
	ld a, [$c12d]
	ld b, a
	ld hl, $c12e
	ld a, [$ccff]
	ld c, a
.asm_c19
	add hl, de
	ld a, c
	add $20
	ld c, a
	ld a, [hl]
	cp b
	jr z, .asm_c19
	ld b, $0
	ld hl, $cefe
	ld [hl], c
	inc hl
	ld [hl], b
	ld hl, $cefc
	ld de, wc10f
	ld bc, $0004
	call asm_cee.asm_cf3
	ld a, [$cefc]
	add $50
	ld [$cefc], a
	ld a, [$cefd]
	adc $0
	ld [$cefd], a
	xor a
	ld [$cd69], a
	ld a, $20
	ld [$cd5a], a
	ld a, [$cefe]
	add $30
	ld [$cd78], a
	ld [$cefe], a
	ld a, [$ceff]
	adc $0
	ld [$cd87], a
	ld [$ceff], a
	ld a, [wLevelNr]
	cp $40
	jr z, .asm_c6e
	jr .asm_c9f

.asm_c6e
	ld h, $0
	ld l, $0
	ld b, $1
	ld c, $50
	add hl, bc
	ld a, l
	ld [wc10f], a
	ld a, h
	ld [$c110], a
	ld h, $0
	ld l, $0
	ld b, $0
	ld c, $60
	add hl, bc
	ld a, l
	ld [$c111], a
	ld a, h
	ld [$c112], a
	ld bc, $0000
	ld de, $0064
	call Functionded
	call Functionef5
	jp .asm_cb7

.asm_c9f
	ld hl, $0024
	call Function3fdf
	ld bc, $0000
	ld de, $0000
	call Functionded
	call Functionef5
	call Function163a
	call Function17eb

.asm_cb7
	ld a, $2
	ld [$cef1], a
	ld a, $7
	ld [rIE], a
	ld a, $8f
	ld [rLYC], a
	ld a, $40
	ld [rSTAT], a
	ret
; 0xcc9


BGMLoopOrder: ; 0xcc9
db Sound_81, Sound_82, Sound_80, Sound_82


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
	ld [wc10c], a
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
	ld bc, data_d44
	push bc
	ld h, d
	ld l, e
	jp hl
; 0xd44


data_d44: ; 0xd44
INCBIN "baserom.gb", $d44, $d5a-$d44


Functiond5a: ; 0xd5a
	ld a, [wc10b]
	or a
	ret z
	dec a
	ld [wc10b], a
	ld e, a
	ld d, $0
	ld a, [wc10c]
	and a
	jp nz, .asm_d79
	ld hl, data_d9a
	add hl, de
	ld a, [hl]
	ld [rBGP], a
	ld hl, data_d9e
	jr .asm_d83

.asm_d79
	ld hl, data_da2
	add hl, de
	ld a, [hl]
	ld [rBGP], a
	ld hl, data_da6

.asm_d83
	add hl, de
	ld a, [hl]
	ld [rOBP0], a
	ld [rOBP1], a

	ld b, $3
	ld hl, wc103
.asm_d8e
	ld a, [hl]
.asm_d8f
	call Function3180
	cp [hl]
	jr z, .asm_d8f

	dec b
	jr nz, .asm_d8e

	jr Functiond5a
; 0xd9a


data_d9a:
db 0, $40, $90, $E4
data_d9e:
db 0, $40, $80, $D0
data_da2:
db 0, $01, $42, $93
data_da6:
db 0, 1, 2, 7


INCBIN "baserom.gb", $daa, $ded-$daa


Functionded: ; 0xded
	xor a
	ld [$c0ac], a
	ld hl, $3dc2
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c0b5
	add hl, bc
	ld a, [de]
	inc de
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, $c0b8
	add hl, bc
	ld a, [de]
	inc de
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld hl, $c0bb
	add hl, bc
	ld a, [de]
	inc de
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	call Function3180
	ld hl, $c0be
	add hl, bc
	ld a, [de]
	inc de
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [MBC1RomBank], a
	inc de
	inc de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	ld d, a
	ld e, l
	jp Function12e5
; 0xe41


Functione41: ; 0xe41
	ld bc, $0000
	ld e, $0
	ld a, c
	ld hl, $c0c3
	ld [hl], e
	ld a, [wc0c6]
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
	ld hl, wc0c7
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
	ld a, [wc0c1]
	ld e, a
	ld a, [$c0c2]
	ld d, a
.asm_e98
	ld a, e
	cp $a0
	ret nc
	push bc
	ld a, [wc0ca]
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
	ld hl, wc0c1
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


Functionef5: ; 0xef5
	call Functionf5d
	ld hl, $c11d
	dec [hl]
	ld hl, $c11e
	dec [hl]
	ld b, $8
.asm_f02
	call Functionf8a
	ld c, $8
.asm_f07
	push hl
	ld a, [hl]
	call Functionfa9
	push hl
	ld a, [$c11e]
	and $7
	add a
	ld l, a
	ld h, $0
	ld de, data_f45
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$c11d]
	and $7
	add a
	add a
	ld e, a
	ld d, $0
	add hl, de
	pop de
	call Functionfbe
	ld hl, $c11d
	inc [hl]
	pop hl
	inc hl
	dec c
	jr nz, .asm_f07
	ld a, [$c11d]
	sub $8
	ld [$c11d], a
	ld hl, $c11e
	inc [hl]
	dec b
	jr nz, .asm_f02
	ret
; 0xf45


data_f45: ; 0xf45
INCBIN "baserom.gb", $f45, $f5d-$f45


Functionf5d: ; 0xf5d
	ld hl, wc10f
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


Functionfbe: ; 0xfbe
	ld a, [wc120]
	ld [MBC1RomBank], a
	push bc
	ld bc, $001c
	ld a, [$c0c5]
	ld b, a
	ld c, $1c
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, b
	ld b, $0
	add hl, bc
	ld b, a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, b
	ld b, $0
	add hl, bc
	ld b, a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, b
	ld b, $0
	add hl, bc
	ld b, a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	inc de
	ld [hli], a
	ld a, [de]
	add b
	ld [hl], a
	pop bc
	ret
; 0x101e


Function101e: ; 0x101e
	ld a, b
	cp $0
	jr z, .asm_1088
	cp $1
	jp z, Function10c0
	cp $2
	jr z, .asm_1064
	ld a, [wc10f]
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
	ld a, [wc10f]
	and $1f
	ret z
	ld c, a
	ld a, $20
	sub c
	ret

.asm_1064
	ld a, [wc10f]
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
	ld a, [wc10f]
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
	ld a, [wc10f]
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
	ld a, [wc10f]
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
	ld hl, data_f45
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
	ld a, [wc10f]
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
	ld hl, data_f45
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


Function1240: ; 0x1240
	xor a
	ld [$c118], a
	ld a, $2
.asm_1246
	ld [$c119], a
	ld hl, $cd26
	ld a, [hl]
	sub $1
	jr c, .asm_126e
.asm_1251
	ld [hli], a
	add a
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Functionfbe
	ld a, $1
	ld [$c118], a
	ld a, [$c119]
	dec a
	jr nz, .asm_1246
	ret

.asm_126e
	ld hl, $cd05
	ld a, [hl]
	sub $1
	jr nc, .asm_1251
	ret
; 0x1277


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
	ld a, [hHoldInputs]
	xor c
	and c
	ld [hCurInputs], a
	ld a, c
	ld [hHoldInputs], a

	ld a, $30
	ld [rJOYP], a

	ld a, [hHoldInputs]
	and $f
	cp $f
	ret nz

	call Functiond5a
	jp _Start
; 0x12b4


Function12b4: ; 0x12b4
	ld c, $80
	ld b, $a
	ld hl, data_12c2
.asm_12bb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_12bb
	ret
; 0x12c2


data_12c2: ; 0x12c2
db $3E, $C0, $E0, $46, $3E, $28, $3D, $20, $FD, $C9


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


Function12e5: ; 0x12e5
	ld a, [de]
	cp $ff
	ret z
	ld [$c0a7], a
	cp $0
	jr z, .asm_1314
	cp $4
	jr z, .asm_1309
	cp $1
	jr z, .asm_1302
	ld hl, $c0b0
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $20
	jr .asm_1329

.asm_1302
	ld hl, VBGMap0
	ld a, $20
	jr .asm_1329

.asm_1309
	ld bc, v8000
	ld a, [$c0ac]
	ld [$c0ab], a
	jr .asm_131f

.asm_1314
	ld bc, v8800
	ld a, [$c0ac]
	ld [$c0ab], a
	add $80

.asm_131f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, $10

.asm_1329
	ld [$c0a6], a
	ld a, l
	ld [$c0a2], a
	ld [$c0a4], a
	ld a, h
	ld [$c0a3], a
	ld [$c0a5], a
	inc de
	inc de
	inc de
	ld a, [de]
	ld [$c0a9], a
	ld [$c0aa], a
	inc de
	ld a, [de]
	ld [$c0a8], a
	inc de
	ld hl, $c0a4
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_1350
	ld a, [de]
	and $7f
	ld [$c0ae], a
	ld a, [de]
	and $80
	ld [$c0ad], a
	inc de
.asm_135d
	ld a, [$c0a7]
	cp $1
	jr z, .asm_1368
	cp $5
	jr nz, .asm_1370

.asm_1368
	ld a, [$c0ab]
	ld b, a
	ld a, [de]
	add b
	jr .asm_1371

.asm_1370
	ld a, [de]

.asm_1371
	ld [hli], a
	call Function3180
	ld a, [$c0ad]
	cp $0
	jr z, .asm_137d
	inc de

.asm_137d
	ld a, [$c0aa]
	sub $1
	ld [$c0aa], a
	jr nc, .asm_13bb
	ld hl, $c0a2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$c0a6]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, l
	ld [$c0a2], a
	ld a, h
	ld [$c0a3], a
	ld a, [$c0a9]
	ld [$c0aa], a
	ld a, [$c0a8]
	dec a
	ld [$c0a8], a
	ld a, [$c0a7]
	cp $0
	jr z, .asm_13b4
	cp $4
	jr nz, .asm_13bb

.asm_13b4
	ld a, [$c0ac]
	inc a
	ld [$c0ac], a

.asm_13bb
	ld a, [$c0ae]
	dec a
	ld [$c0ae], a
	jr nz, .asm_135d
	ld a, [$c0ad]
	cp $0
	jr nz, .asm_13cc
	inc de

.asm_13cc
	ld a, [$c0a8]
	cp $ff
	jp nz, .asm_1350
	jp Function12e5
; 0x13d7


Function13d7: ; 0x13d7
	ld hl, $c12d
.asm_13da
	ld a, [de]
	cp $ff
	ret z
	ld a, [de]
	and $7f
	ld [$c0ae], a
	ld a, [de]
	and $80
	ld [$c0ad], a
	inc de
.asm_13eb
	ld a, [de]
	ld [hli], a
	call Function3180
	ld a, [$c0ad]
	cp $0
	jr z, .asm_13f8
	inc de

.asm_13f8
	ld a, [$c0ae]
	dec a
	ld [$c0ae], a
	jr nz, .asm_13eb
	ld a, [$c0ad]
	cp $0
	jr nz, .asm_1409
	inc de

.asm_1409
	jr .asm_13da
; 0x140b


Function140b: ; 0x140b
	ld hl, $c123
	ld d, $0
.asm_1410
	cp [hl]
	jr nc, .asm_1417
	inc hl
	inc d
	jr .asm_1410

.asm_1417
	ld hl, $ceef
	ld [hl], d
	ret
; 0x141c


Function141c: ; 0x141c
	add hl, de
	ld a, [hli]
	ld [MBC1RomBank], a
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 0x1426


Function1426: ; 0x1426
	push bc
	xor a
	ld [$c11c], a
	ld hl, $cee3
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0048
	add hl, bc
	call Function174c
	jr c, .asm_1475
	ld bc, $0008
	add hl, bc
	call Function174c
	jr c, .asm_148d
	jr z, .asm_148d
	ld a, e
	sub l
	cp $6
	jr c, .asm_1453
	ld a, $5

.asm_1453
	ld c, a
	ld b, $3
	call Function101e
	or a
	jr z, .asm_148d
	ld e, a
	ld d, $0
.asm_145f
	ld hl, wc10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	ld [wc10f], a
	ld a, h
	ld [$c110], a
	ld a, $1
	ld [$c11c], a
	jr .asm_148d

.asm_1475
	ld a, l
	sub e
	cp $6
	jr c, .asm_147d
	ld a, $5

.asm_147d
	ld c, a
	ld b, $2
	call Function101e
	or a
	jr z, .asm_148d
	cpl
	inc a
	ld e, a
	ld d, $ff
	jr .asm_145f

.asm_148d
	ld hl, $cee5
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $c111
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0031
	add hl, bc
	call Function174c
	jr c, .asm_14d7
	ld bc, $0001
	add hl, bc
	call Function174c
	jr c, .asm_14d5
	jr z, .asm_14d5
	ld a, e
	sub l
	cp $6
	jr c, .asm_14b5
	ld a, $5

.asm_14b5
	ld c, a
	ld b, $0
	call Function101e
	or a
	jr z, .asm_14d5
	ld e, a
	ld d, $0
.asm_14c1
	ld hl, $c111
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, l
	ld [$c111], a
	ld a, h
	ld [$c112], a
	ld a, $2
	ld [$c11c], a

.asm_14d5
	pop bc
	ret

.asm_14d7
	ld a, l
	sub e
	cp $6
	jr c, .asm_14df
	ld a, $5

.asm_14df
	ld c, a
	ld b, $1
	call Function101e
	or a
	jr z, .asm_14d5
	cpl
	inc a
	ld e, a
	ld d, $ff
	jr .asm_14c1
; 0x14ef


Function14ef: ; 0x14ef
	push de
	push hl
	push bc
	ld a, e
	ld [$ceed], a
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld a, d
	ld [$c11d], a
	ld a, l
	ld [$ceee], a
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, h
	ld [$c11e], a
	call Functionf8a
	ld a, [$4000]
	push af
	ld a, [hl]
	call Functionfa9
	ld a, [$ceee]
	xor $ff
	srl a
	and $c
	ld b, a
	ld a, [$ceed]
	srl a
	srl a
	srl a
	and $3
	add b
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call Function140b
	pop af
	ld [MBC1RomBank], a
	ld a, d
	pop bc
	pop hl
	pop de
	ret
; 0x154c


Function154c: ; 0x154c
	call Function157f

Function154f: ; 0x154f
	ld hl, $cdc3
	add hl, bc
	ld a, [hl]
	ld e, $0
	bit 7, a
	jr z, .asm_155b
	dec e

.asm_155b
	ld d, e
	sla a
	rl e
	sla a
	rl e
	sla a
	rl e
	ld hl, $cda5
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, $cee5
	ld a, e
	adc [hl]
	ld [$cef5], a
	ld e, a
	inc hl
	ld a, d
	adc [hl]
	ld [$cef6], a
	ld d, a
	ret
; 0x157f


Function157f: ; 0x157f
	ld hl, $cdb4
	add hl, bc
	ld a, [hl]
	ld e, $0
	bit 7, a
	jr z, .asm_158b
	dec e

.asm_158b
	ld d, e
	sla a
	rl e
	sla a
	rl e
	sla a
	rl e
	ld hl, $cd96
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, $cee3
	ld a, e
	adc [hl]
	ld [$cef3], a
	ld e, a
	inc hl
	ld a, d
	adc [hl]
	ld [$cef4], a
	ld d, a
	ret
; 0x15af


Function15af: ; 0x15af
	push bc
	ld a, [wc10f]
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


INCBIN "baserom.gb", $15d2, $15d9-$15d2


Function15d9: ; 0x15d9
	ld de, $ffe0
	ld hl, $00c0
	call Function15ed
	ret nz
	ld de, $ffe0
	ld hl, $00c0
	call Function1616
	ret
; 0x15ed


Function15ed: ; 0x15ed
	ld a, [wc10f]
	add e
	ld e, a
	ld a, [$c110]
	adc d
	ld d, a
	ld a, [$cee4]
	cp d
	jr z, .asm_1600
	ret c
	jr .asm_1605

.asm_1600
	ld a, [$cee3]
	cp e
	ret c

.asm_1605
	add hl, de
	ld a, [$cee4]
	cp h
	ld a, [$cee3]
	jr z, .asm_1612
.asm_160f
	ret nc
	xor a
	ret

.asm_1612
	cp l
	ret z
	jr .asm_160f
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
	jr z, Function15ed.asm_1612
	jr Function15ed.asm_160f
; 0x163a


Function163a: ; 0x163a
	ld hl, $caf3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a

.asm_1641
	ld [wcaf5], a
	ld a, [wcaf2]
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
	ld a, [wcaf5]
	call Function1732
	jr z, .asm_169f

	ld hl, $cee3
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc10f
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
	ld a, [wcaf5]
	call Function173e

.asm_169f
	pop hl
	ld bc, $0005
	add hl, bc
	ld a, [wcaf1]
	ld b, a
	ld a, [wcaf5]
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
	ld a, [wcaf5]
	ld [hl], a
	call Function1794
	call Function17b5
	ld hl, $cde1
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $cea4
	add hl, bc
	ld a, [wc104]
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


Function1773: ; 0x1773
	ld hl, $ce1d
	add hl, bc
	ld a, [hl]
	ld [$cee3], a
	ld hl, $ce2c
	add hl, bc
	ld a, [hl]
	ld [$cee4], a
	ld hl, $ce3b
	add hl, bc
	ld a, [hl]
	ld [$cee5], a
	ld hl, $ce4a
	add hl, bc
	ld a, [hl]
	ld [$cee6], a
	ret
; 0x1794


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
	ld hl, wc0c1
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


Function17eb: ; 0x17eb
	ld a, $0
	ld [wcaf6], a
	ld hl, $caf3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
.asm_17f7
	ld [wcaf5], a
	ld a, [wcaf2]
	ld [MBC1RomBank], a
	ld a, [hl]
	cp $a
	jr c, .asm_1812
	cp $14
	jr nc, .asm_1812
	ld a, [wcaf6]
	add $1
	daa
	ld [wcaf6], a

.asm_1812
	ld bc, $0005
	add hl, bc
	ld a, [wcaf1]
	ld b, a
	ld a, [wcaf5]
	inc a
	cp b
	jp nz, .asm_17f7
	ret
; 0x1823


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

.asm_1851
	ld e, $4

.asm_1853
	ld hl, $cd4b
	add hl, bc
	ld a, [hl]
	cp $0
	jp z, .asm_1901
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
	ld hl, wcaf7
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
	ld hl, wcaf7
	cp [hl]
	jr c, .asm_18e1
	ld [wcaf7], a

.asm_18e1
	ld a, $10
	call Function205e
	and a
	ld a, [wcaf6]
	dec a
	daa
	cp $0
	jr nz, .asm_18f2
	ld a, $0

.asm_18f2
	ld [wcaf6], a
	push de
	ld a, Sound_47
	call FarCall_StartMusic
	ld e, $1
	call Function2006
	pop de

.asm_1901
	inc e
	ld a, $e
	cp e
	jp nc, .asm_1853
	inc c
	ld a, $3
	cp c
	jp nc, .asm_1851
	ret
; 0x1910


Function1910: ; 0x1910
	push bc
	push de
	ld a, [$cee1]
	ld c, a
	ld b, $0
	ld a, $12
	ld [wc0d9], a
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
	ld [wc0cd], a
	ld a, $0
	ld [wc0ce], a
	ld a, [wc0cd]
	ld l, a
	ld a, [wc0ce]
	ld h, a
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld a, l
	ld [wc0cd], a
	ld a, h
	ld [wc0ce], a
	ld a, [$ceeb]
	ld l, a
	ld a, [$ceec]
	ld h, a
	ld a, [wc0cd]
	ld e, a
	ld a, [wc0ce]
	ld d, a
	add hl, de
	ld a, l
	ld [$ceeb], a
	ld a, h
	ld [$ceec], a
	ld a, [wc0cd]
	ld l, a
	ld a, [wc0ce]
	ld h, a
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
	ld a, l
	ld [wc0cd], a
	ld a, h
	ld [wc0ce], a
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
	ld a, [wc0d9]
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
	ld a, [wc0db]
	cp $5
	ret z
	ld hl, wc0f4
	inc [hl]
	ld e, $4

.asm_19bf
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
	ld de, data_1a39
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
	jp c, .asm_19bf
	ld a, [$c0f5]
	and a
	jr nz, .asm_1a06
	ld a, [wc0f4]
	cp $3c
	ret c
	jr .asm_1a12

.asm_1a06
	ld a, [wc0f4]
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
	ld [wc0f4], a
	ret
; 0x1a26


Function1a26: ; 0x1a26
	push af
	push de
	push hl
	ld d, $0
	ld a, [$cee1]
	ld e, a
	ld hl, $cd4b
	add hl, de
	xor a
	ld [hl], a
	pop hl
	pop de
	pop af
	ret
; 0x1a39


data_1a39: ; 0x1a39
dw Function1b0b, Function1b0b, Function1b0b, Function1d72, Function1da4, Function1b0c, Function1bf4, Function1be7
dw Function1b39, Function1b39, Function1b39, Function1b39, Function1b39, Function1b39, Function1b39, Function1b39
dw Function1b39, Function1b39, Function1b39, Function1b39, Function1bca, Function1bca, Function1bca, Function1bca
dw Function1b45, Function1b6d.asm_1b7d, Function1b6d, Function1bca, Function1bca, Function1bca, Function1bca, Function1bca
dw Function1bca, Function1bcd, Function1bda, Function1cf9, Function1c3c, Function1c3f, Function1c3f, Function1c42
dw Function1c42, Function1c45, Function1c48, Function1c4b, Function1d72, Function1da4, Function1c4e, Function1c51
dw Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54
dw Function1c54, Function1c54, Function1b0b, Function1b0b, Function1cd2, Function1cd2.asm_1cd6, Function1cd2.asm_1cda, Function1cd2.asm_1cde
dw Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54
dw Function1c54, Function1c54, Function1b0b, Function1b0b, Function1c54, Function1c54, Function1c54, Function1c54
dw Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1bf4, Function1be7
dw Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54, Function1c54
dw Function1c54, Function1c54, Function1d72, Function1b0b, Function1b0b, Function1b0b, Function1b0b, Function1b0b, Function1b0b


Function1b0b: ; 0x1b0b
	ret
; 0x1b0c


Function1b0c: ; 0x1b0c
	ld a, $15
	call Function205e
	ld a, $c
	call FarCall_StartMusic
	jp Function1a26
; 0x1b19


Function1b19: ; 0x1b19
	ld a, [wc0e5]
	cp $90
	jr nc, .asm_1b26
	add $2
	daa
	ld [wc0e5], a

.asm_1b26
	jp Function1a26
; 0x1b29


Function1b29: ; 0x1b29
	ld a, [wc0e5]
	cp $90
	jr nc, Function1b19.asm_1b26 ; 0x1b2e $f6
	add $1
	daa
	ld [wc0e5], a
	jp Function1a26
; 0x1b39


Function1b39: ; 0x1b39
	ld hl, $ce59
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_1b42
	ret

.asm_1b42
	jp Function1cf9
; 0x1b45


Function1b45: ; 0x1b45
	ld hl, $cd4b
	add hl, de
	ld a, $2
	ld [hl], a
	ld hl, $ce77
	add hl, de
	ld [hl], $21
	ld a, [wc0dc]
	cp $11
	jr c, .asm_1b68
	and a
	add $90
	daa
	jr nc, .asm_1b68
	cp $11
	jr nc, .asm_1b65
	ld a, $10

.asm_1b65
	ld [wc0dc], a

.asm_1b68
	ld a, $17
	jp FarCall_StartMusic
; 0x1b6d


Function1b6d: ; 0x1b6d
	ld a, [wc0dc]
	and a
	add $95
	daa
	jr nc, .asm_1b7d
	cp $3
	jr c, .asm_1b7d
	ld [wc0dc], a

.asm_1b7d
	call Function1b83
	jp Function1a26
; 0x1b83


Function1b83: ; 0x1b83
	ld a, [$cee1]
	ld e, a
	ld d, $0
	ld hl, $ce86
	add hl, de
	ld a, [hl]
	and $f
	ld e, a
	ld hl, $1baa
	add hl, de
	ld a, [hl]
	ld hl, $cdb4
	add [hl]
	ld [hl], a
	ld hl, $1bba
	add hl, de
	ld a, [hl]
	ld hl, $cdc3
	add [hl]
	ld [hl], a
	ld a, $6
	jp Function1e31
; 0x1baa


INCBIN "baserom.gb", $1baa, $1bca-$1baa


Function1bca: ; 0x1bca
	jp Function1cf9
; 0x1bcd


Function1bcd: ; 0x1bcd
	ld a, $c
	call FarCall_StartMusic
	ld a, $e6
	ld [wc102], a
	jp Function1a26
; 0x1bda


Function1bda: ; 0x1bda
	ld a, $c
	call FarCall_StartMusic
	ld a, $10
	call Function205e
	jp Function1a26
; 0x1be7


Function1be7: ; 0x1be7
	ld a, $9
	call FarCall_StartMusic
	ld a, $30
	call Function1e31
	jp Function1bfe
; 0x1bf4


Function1bf4: ; 0x1bf4
	ld a, $8
	call FarCall_StartMusic
	ld a, $17
	call Function1e31

Function1bfe: ; 0x1bfe
	ld a, [$c0f2]
	and $7
	ld hl, data_1c2c
	call Function2ef
	ld [$cdb4], a
	ld a, [$c0f2]
	and $7
	ld hl, $1c34
	call Function2ef
	ld [$cdc3], a
	ld a, $1
	ld [$c0f8], a
	ld a, [$cee1]
	ld e, a
	ld d, $0
	ld hl, $ce77
	add hl, de
	ld [hl], $1f
	ret
; 0x1c2c


data_1c2c: ; 0x1c2c
INCBIN "baserom.gb", $1c2c, $1c3c-$1c2c


Function1c3c: ; 0x1c3c
	jp Function1d72
; 0x1c3f


Function1c3f: ; 0x1c3f
	jp Function1da4
; 0x1c42


Function1c42: ; 0x1c42
	jp Function1d72
; 0x1c45


Function1c45: ; 0x1c45
	jp Function1da4
; 0x1c48


Function1c48: ; 0x1c48
	jp Function1d72
; 0x1c4b


Function1c4b: ; 0x1c4b
	jp Function1da4
; 0x1c4e


Function1c4e: ; 0x1c4e
	jp Function1b0b
; 0x1c51


Function1c51: ; 0x1c51
	jp Function1cf9
; 0x1c54


Function1c54: ; 0x1c54
	ld a, [$ce77]
	and a
	jr nz, .asm_1c5b
	ret

.asm_1c5b
	ld hl, $cd4b
	add hl, de
	ld a, [hl]
	cp $57
	jr nc, .asm_1ca5
	cp $4b
	jr nc, .asm_1c92
	cp $3f
	jr nc, .asm_1c7f
	ld hl, $cd78
	add hl, de
	ld a, [hl]
	and a
	add $1e
	ld [hl], a
	jr nc, .asm_1cb5
	ld hl, $cd87
	add hl, de
	inc [hl]
	jp .asm_1cb5

.asm_1c7f
	ld hl, $cd78
	add hl, de
	ld a, [hl]
	and a
	sub $1e
	ld [hl], a
	jr nc, .asm_1cb5
	ld hl, $cd87
	add hl, de
	dec [hl]
	jp .asm_1cb5

.asm_1c92
	ld hl, $cd5a
	add hl, de
	ld a, [hl]
	and a
	add $1e
	ld [hl], a
	jr nc, .asm_1cb5
	ld hl, $cd69
	add hl, de
	inc [hl]
	jp .asm_1cb5

.asm_1ca5
	ld hl, $cd5a
	add hl, de
	ld a, [hl]
	and a
	sub $1e
	ld [hl], a
	jr nc, .asm_1cb5
	ld hl, $cd69
	add hl, de
	dec [hl]

.asm_1cb5
	ld hl, $cd4b
	add hl, de
	ld a, [hl]
	sub $30
	ld hl, data_1e42
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	ld a, [$cee1]
	ld e, a
	ld hl, $cd4b
	add hl, de
	ld a, c
	ld [hl], a
	ld a, $a
	jp FarCall_StartMusic
; 0x1cd2


Function1cd2: ; 0x1cd2
	ld e, $1
	jr .asm_1ce0

.asm_1cd6
	ld e, $2
	jr .asm_1ce0

.asm_1cda
	ld e, $5
	jr .asm_1ce0

.asm_1cde
	ld e, $8

.asm_1ce0
	call Function2006
	ld a, [$cee1]
	ld hl, $cd4b
	ld e, a
	add hl, de
	ld a, [hl]
	add $27
	ld [hl], a
	ld hl, $cea4
	add hl, de
	ld [hl], a
	ld a, $b
	jp FarCall_StartMusic
; 0x1cf9


Function1cf9: ; 0x1cf9
	ld a, [$c0f5]
	and a
	ret nz
	ld hl, $c0f6
	inc [hl]
	ld hl, $ce77
	add hl, de
	ld [hl], $1f
	ld a, [$c0f2]
	and $7
	ld hl, $1d29
	call Function2ef
	ld [$cdb4], a
	ld a, [$c0f2]
	and $7
	ld hl, $1d31
	call Function2ef
	ld [$cdc3], a
	ld a, $c
	jp Function1e31
; 0x1d29


INCBIN "baserom.gb", $1d29, $1d72-$1d29


Function1d72: ; 0x1d72
	call Function1cf9
	ld a, [$cee1]
	ld e, a
	ld d, $0
	ld hl, $cdc3
	add hl, de
	ld a, [hl]
	and $80
	bit 7, a
	jr nz, .asm_1d91
	ld a, [$c0f2]
	ld e, a
	ld hl, $1de0
	add hl, de
	ld a, [hl]
	jr .asm_1d9a

.asm_1d91
	ld a, [$c0f2]
	ld e, a
	ld hl, $1dd6
	add hl, de
	ld a, [hl]

.asm_1d9a
	ld hl, $cdb4
	add [hl]
	ld [hl], a
	ld a, $2d
	jp Function1e31
; 0x1da4


Function1da4: ; 0x1da4
	call Function1cf9
	ld a, [$cee1]
	ld e, a
	ld d, $0
	ld hl, $cdc3
	add hl, de
	ld a, [hl]
	and $80
	bit 7, a
	jr nz, .asm_1dc3
	ld a, [$c0f2]
	ld e, a
	ld hl, $1de2
	add hl, de
	ld a, [hl]
	jr .asm_1dcc

.asm_1dc3
	ld a, [$c0f2]
	ld e, a
	ld hl, $1dd8
	add hl, de
	ld a, [hl]

.asm_1dcc
	ld hl, $cdc3
	add [hl]
	ld [hl], a
	ld a, $2d
	jp Function1e31
; 0x1dd6



INCBIN "baserom.gb", $1dd6, $1dea-$1dd6


Function1dea: ; 0x1dea
	push bc
	push de
	ld a, $9
	ld [wc0d9], a
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


Function1e31: ; 0x1e31
	push de
	ld e, a
	ld a, [$ce77]
	and a
	jr z, .asm_1e3c
	cp e
	jr c, .asm_1e40

.asm_1e3c
	ld a, e
	ld [$ce77], a

.asm_1e40
	pop de
	ret
; 0x1e42


data_1e42: ; 0x1e42
INCBIN "baserom.gb", $1e42, $2006-$1e42


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
	ld hl, wc0e6
	inc [hl]
	ld a, Sound_4f
	call FarCall_StartMusic

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
	ld a, [wc0dc]
	and a
	add e
	daa
	jr c, .asm_206b
	ld [wc0dc], a

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
	ld [wcaf7], a
	xor a
	ld [wc0dd], a
	xor a
	ld [wc100], a
	ld [wc101], a
	ld [wc102], a
	ld [$c0f8], a
	ld a, $7
	ld [wc0e0], a
	ret
; 0x2098


Function2098: ; 0x2098
	ld bc, $0000
	xor a
	ld [wc101], a
	ld a, [$ce95]
	cp $1
	jr z, .asm_20b6
	cp $2
	jr z, .asm_20b0
	call Function2313
	jp .asm_21da

.asm_20b0
	call Function234b
	jp .asm_21da

.asm_20b6
	ld a, [wc0db]
	cp $b
	jp nc, $21c4
	cp $3
	jp z, $21c4
	cp $5
	jp z, $21ce
	ld hl, hHoldInputs
	bit 1, [hl]
	jr nz, .asm_20d5
	xor a
	ld [$cef0], a
	jr .asm_20e9

.asm_20d5
	ld hl, $cef0
	bit 0, [hl]
	jr nz, .asm_20e9
	ld a, $1
	ld [$cef0], a
	ld a, $6
	call FarCall_StartMusic
	call Function357.asm_38c

.asm_20e9
	ld a, [$ce77]
	and a
	jr nz, .asm_2118
	ld hl, wc0e0
	dec [hl]
	jr nz, .asm_2118
	ld a, $7
	ld [hl], a
	ld hl, hHoldInputs
	bit 4, [hl]
	jp nz, $210f
	bit 5, [hl]
	jr z, .asm_2118
	ld a, [$ce86]
	dec a
	and $f
	ld [$ce86], a
	jr .asm_2118

	ld a, [$ce86]
	inc a
	and $f
	ld [$ce86], a

.asm_2118
	call Function2412
	ld a, [$ce77]
	and a
	jr z, .asm_2127
	dec a
	ld [$ce77], a
	jr .asm_212b

.asm_2127
	xor a
	ld [$c0f8], a

.asm_212b
	xor a
	ld [$c0f9], a
	ld [$c0fa], a
	ld hl, $cee3
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $cee5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function14ef
	ld [$c0f7], a
	ld a, [$ce77]
	and a
	jp nz, $2181
	ld hl, hHoldInputs
	bit 0, [hl]
	jp z, $2181
	ld hl, data_2276
	ld a, [wc102]
	and a
	jr z, .asm_215f
	ld hl, $2296

.asm_215f
	ld a, [$ce86]
	and $f
	call Function2ef
	ld [$c0f9], a
	ld hl, $2286
	ld a, [wc102]
	and a
	jr z, .asm_2176
	ld hl, $22a6

.asm_2176
	ld a, [$ce86]
	and $f
	call Function2ef
	ld [$c0fa], a
	ld a, [$c0f7]
	ld d, $0
	add a
	ld e, a
	ld hl, $22e6
	add hl, de
	ld a, [$c0f9]
	add [hl]
	ld [$c0f9], a
	inc hl
	ld a, [$c0fa]
	add [hl]
	ld [$c0fa], a
	call Function2425
	ld [$c0fa], a
	ld a, [$c0f9]
	call Function2425
	ld [$c0f9], a
	ld a, [$c0f9]
	ld h, a
	ld a, [$cdb4]
	call Function23ea
	ld [$cdb4], a
	ld a, [$c0fa]
	ld h, a
	ld a, [$cdc3]
	call Function23ea
	ld [$cdc3], a
	ld a, [$c0f7]
	and a
	jr z, .asm_21ce
	cp $2
	jr z, .asm_21d4

.asm_21ce
	call Function2384
	call Function23b7

.asm_21d4
	call Function2454
	ld bc, $0000

.asm_21da
	ld a, [$c0f8]
	and a
	jr z, .asm_21f0
	ld a, [wc104]
	and $1
	jr nz, .asm_21f0
	ld a, [$ce86]
	inc a
	and $f
	ld [$ce86], a

.asm_21f0
	xor a
	ld [wc0ca], a
	ld a, [$ce86]
	cp $8
	jr c, .asm_220c
	ld [wc0cd], a
	ld hl, wc0cd
	ld a, $10
	and a
	sbc [hl]
	push af
	ld a, $20
	ld [wc0ca], a
	pop af

.asm_220c
	ld [wc0c7], a
	ld hl, wc0c6
	ld [hl], $0
	ld a, [wc0db]
	cp $5
	jr nz, .asm_2245
	xor a
	ld [wc0ca], a
	ld a, $f
	ld [wc0c6], a
	ld a, [wc0de]
	srl a
	srl a
	cp $f
	jr c, .asm_2238
	call Function1794
	call Function1426
	jp Function15af

.asm_2238
	and $f
	ld d, $0
	ld e, a
	ld hl, $22d6
	add hl, de
	ld a, [hl]
	ld [wc0c7], a

.asm_2245
	call Function1794
	ld a, [$ce95]
	cp $2
	jr z, .asm_2252
	call Function22f4

.asm_2252
	call Function15af
	ld a, [$ce95]
	cp $1
	jr nz, .asm_2269
	ld a, [$ce77]
	and a
	jr z, .asm_2269
	ld a, [wc104]
	and $8
	jr nz, .asm_2269

.asm_2269
	ld a, [wc0c6]
	cp $f
	jr z, .asm_2273
	jp Function272a

.asm_2273
	jp Functione41
; 0x2276


data_2276: ; 0x2276
INCBIN "baserom.gb", $2276, $22f4-$2276


Function22f4: ; 0x22f4
	ld a, [$ce95]
	cp $0
	jr nz, .asm_2310
	ld a, [$cefd]
	ld hl, $cd69
	cp [hl]
	jr c, .asm_2310
	jr nz, .asm_230f
	ld a, [$cefc]
	ld hl, $cd5a
	cp [hl]
	jr c, .asm_2310

.asm_230f
	ret

.asm_2310
	jp Function1426
; 0x2313


Function2313: ; 0x2313
	ld a, [$ce77]
	dec a
	ld [$ce77], a
	cp $25
	jr nz, .asm_232c
	ld a, $1
	ld [$ce95], a
	xor a
	ld [$ce86], a
	ld [$ce77], a
	jr .asm_2345

.asm_232c
	ld a, $31
	ld [$cdb4], a
	xor a
	ld [$cdc3], a
	ld a, [wc104]
	and $1
	jr nz, .asm_2345
	ld a, [$ce86]
	inc a
	and $f
	ld [$ce86], a

.asm_2345
	call Function154c
	jp Function2fe
; 0x234b


Function234b: ; 0x234b
	ld a, $21
	ld [$cdb4], a
	xor a
	ld [$cdc3], a
	ld a, [wc104]
	and $1
	jr nz, .asm_2364
	ld a, [$ce86]
	inc a
	and $f
	ld [$ce86], a

.asm_2364
	call Function154c
	call Function2fe
	ld a, [$cf00]
	and a
	jr z, .asm_2383
	ld a, $7
	ld [wc0db], a
	ld a, $1f
	ld [wc0de], a
	ld a, $1
	ld [wc0df], a
	xor a
	ld [$cd4b], a

.asm_2383
	ret
; 0x2384


Function2384: ; 0x2384
	ld a, [$cdb4]
	and a
	jr z, .asm_23b6
	ld a, [$c0ee]
	srl a
	srl a
	srl a
	srl a
	and a
	ld [$c0ee], a
	jr nz, .asm_23b6
	ld a, [$cdb4]
	and a
	jr z, .asm_23b6
	ld a, $ff
	ld [$c0ee], a
	ld a, [$cdb4]
	bit 7, a
	jr nz, .asm_23b2
	dec a
	ld [$cdb4], a
	ret

.asm_23b2
	inc a
	ld [$cdb4], a

.asm_23b6
	ret
; 0x23b7


Function23b7: ; 0x23b7
	ld a, [$cdc3]
	and a
	jr z, .asm_23e9
	ld a, [$c0ef]
	srl a
	srl a
	srl a
	srl a
	and a
	ld [$c0ef], a
	jr nz, .asm_23e9
	ld a, [$cdc3]
	and a
	jr z, .asm_23e9
	ld a, $ff
	ld [$c0ef], a
	ld a, [$cdc3]
	bit 7, a
	jr nz, .asm_23e5
	dec a
	ld [$cdc3], a
	ret

.asm_23e5
	inc a
	ld [$cdc3], a

.asm_23e9
	ret
; 0x23ea


Function23ea: ; 0x23ea
	push de
	ld e, a
	ld a, h
	and a
	jr nz, .asm_23f3
	ld a, e
	pop de
	ret

.asm_23f3
	ld a, h
	bit 7, a
	jr nz, .asm_2405
	ld a, e
	add $2
	bit 7, a
	jr nz, .asm_2403
	cp h
	jr c, .asm_2403
.asm_2402
	ld a, e

.asm_2403
	pop de
	ret

.asm_2405
	ld a, e
	and a
	sub $2
	bit 7, a
	jr z, .asm_2403
	cp h
	jr nc, .asm_2403
	jr .asm_2402
; 0x2412


Function2412: ; 0x2412
	ld a, [wc102]
	cp $0
	jr z, .asm_2424
	ld a, [wc104]
	and $3
	jr nz, .asm_2424
	ld hl, wc102
	dec [hl]

.asm_2424
	ret
; 0x2425


Function2425: ; 0x2425
	ld e, a
	ld a, $3c
	ld [wc0cd], a
	ld a, [wc102]
	and a
	jr z, .asm_2436
	ld a, $5a
	ld [wc0cd], a

.asm_2436
	ld hl, wc0cd
	ld a, e
	bit 7, a
	jr nz, .asm_2443
	cp [hl]
	jr c, .asm_2442
	ld a, [hl]

.asm_2442
	ret

.asm_2443
	ld a, [wc0cd]
	cpl
	inc a
	ld [wc0cd], a
	ld a, e
	ld hl, wc0cd
	cp [hl]
	jr nc, .asm_2453
	ld a, [hl]

.asm_2453
	ret
; 0x2454


Function2454: ; 0x2454
	xor a
	ld [wc0cd], a
	ld [wc0cf], a
	ld bc, $0000
	call Function157f
	ld a, [$cdb4]
	and a
	jp z, .asm_24cd
	ld hl, $2568
	bit 7, a
	jr z, .asm_2471
	inc hl
	inc hl

.asm_2471
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, e
	ld [$c0d3], a
	ld a, d
	ld [$c0d4], a
	ld hl, $cef3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $cee5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0003
	add hl, bc
	call Function14ef
	cp $1
	jr z, .asm_24ba
	ld a, [$c0d3]
	ld e, a
	ld a, [$c0d4]
	ld d, a
	ld hl, $cef3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $cee5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $ff
	ld c, $fd
	add hl, bc
	call Function14ef
	cp $1
	jr nz, .asm_24cd

.asm_24ba
	ld a, [$cdb4]
	call Function2f9
	ld [$cdb4], a
	ld a, $6
	call Function1e31
	ld a, $1
	ld [wc0cd], a

.asm_24cd
	ld bc, $0000
	call Function154f
	ld a, [$cdc3]
	and a
	jp z, .asm_2543
	ld hl, $256c
	bit 7, a
	jr z, .asm_24e3
	inc hl
	inc hl

.asm_24e3
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, e
	ld [$c0d3], a
	ld a, d
	ld [$c0d4], a
	ld hl, $cef5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	push hl
	ld hl, $cee3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $0003
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	call Function14ef
	cp $1
	jr z, .asm_2530
	ld a, [$c0d3]
	ld e, a
	ld a, [$c0d4]
	ld d, a
	ld hl, $cef5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	push hl
	ld hl, $cee3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $ff
	ld c, $fd
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	call Function14ef
	cp $1
	jr nz, .asm_2543

.asm_2530
	ld a, [$cdc3]
	call Function2f9
	ld [$cdc3], a
	ld a, $1
	ld [wc0cf], a
	ld a, $6
	call Function1e31

.asm_2543
	ld a, [wc0cd]
	and a
	jr nz, .asm_2555
	ld hl, $cef3
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $cee3
	ld [hl], e
	inc hl
	ld [hl], d

.asm_2555
	ld a, [wc0cf]
	and a
	jr nz, .asm_2567
	ld hl, $cef5
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $cee5
	ld [hl], e
	inc hl
	ld [hl], d

.asm_2567
	ret
; 0x2568


INCBIN "baserom.gb", $2568, $2570-$2568


data_2570:


INCBIN "baserom.gb", $2570, $2721-$2570


Function2721: ; 0x2721
	call Function1794
	call Function15af
	call Functiona94

Function272a: ; 0x272a
	ld a, [$4000]
	push af
	ld a, Bank(Function14001)
	ld [MBC1RomBank], a
	call Function14001
	pop af
	ld [MBC1RomBank], a
	ret
; 0x273b


Function273b: ; 0x273b
	call Function1794
	call Function15af
	call Functiona94
	ld a, [$4000]
	push af
	ld a, Bank(Function140db)
	ld [MBC1RomBank], a
	call Function140db
	pop af
	ld [MBC1RomBank], a
	ret
; 0x2755


Function2755: ; 0x2755
	call Function1794
	call Function15af
	call Functiona94
	jp Functione41
; 0x2761


Function2761: ; 0x2761
	ld a, [$4000]
	push af
	ld a, Bank(Function14133)
	ld [MBC1RomBank], a
	call Function14133
	pop af
	ld [MBC1RomBank], a
	ret
; 0x2772


Function2772: ; 0x2772
	call Function1794
	call Function15af
	call Functiona94
	ld a, [$4000]
	push af
	ld a, Bank(Function141c7)
	ld [MBC1RomBank], a
	call Function141c7
	pop af
	ld [MBC1RomBank], a
	ret
; 0x278c


Function278c: ; 0x278c
	ld hl, $ce77
	add hl, bc
	ld a, [hl]
	and $f
	dec a
	ld [hl], a
	jr nz, .asm_27b1
	push hl
	ld hl, $27d9
	ld a, [wc0e8]
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	ld hl, $ce86
	add hl, bc
	ld a, [hl]
	inc a
	and $f
	ld [hl], a
	call Function357.asm_364

.asm_27b1
	ld hl, $ce86
	add hl, bc
	ld a, [hl]
	cp $8
	jr c, .asm_27ce
	ld [wc0cd], a
	ld hl, wc0cd
	ld a, $10
	and a
	sbc [hl]
	push af
	ld a, [wc0ca]
	or $20
	ld [wc0ca], a
	pop af

.asm_27ce
	ld [wc0c7], a
	ld hl, wc0c6
	ld [hl], $b
	jp Function2721
; 0x27d9


Function27d9: ; 0x27d9
	dec bc
	ld a, [bc]
	ld a, [bc]
	add hl, bc
	add hl, bc
	ld [$0607], sp
	dec b
	ld hl, $cde1
	add hl, bc
	ld a, [hl]
	ld [wc0c7], a
	ld a, [wc104]
	and $7
	jr nz, .asm_27f6
	ld a, [hl]
	inc a
	and $1
	ld [hl], a

.asm_27f6
	ld hl, wc0c6
	ld [hl], $2
	jp Function2721
; 0x27fe


Function27fe: ; 0x27fe
	ld hl, wc0c6
	ld [hl], $7
	call Function283d.asm_2849
	jp Function2811
; 0x2809


Function2809: ; 0x2809
	ld hl, wc0c6
	ld [hl], $6
	call Function283d

Function2811: ; 0x2811
	ld hl, $cde1
	add hl, bc
	ld a, [hl]
	ld [wc0c7], a
	ld a, [wc104]
	and $f
	jr nz, .asm_2828
	ld hl, $cde1
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a

.asm_2828
	jp Function2721
; 0x282b


Function282b: ; 0x282b
	ld hl, $cf01
	ld a, [hl]
	srl a
	ld [$c0d3], a
	ld e, a
	ld d, $0
	ld hl, data_28a1
	add hl, de
	ld a, [hl]
	ret
; 0x283d


Function283d: ; 0x283d
	call Function282b
	ld [wc0cd], a
	xor a
	ld [wc0cf], a
	jr .asm_2853

.asm_2849
	call Function282b
	ld [wc0cf], a
	xor a
	ld [wc0cd], a

.asm_2853
	ld b, $0
	ld a, [$cee1]
	ld c, a
	call Function1773
	ld a, [$c0d3]
	srl a
	srl a
	srl a
	ld d, $0
	ld e, a
	ld hl, $28cd
	add hl, de
	ld a, [hl]
	ld hl, $cdc3
	add hl, bc
	ld [hl], a
	ld a, [wc0cf]
	ld e, $0
	bit 7, a
	jr z, .asm_287c
	dec e

.asm_287c
	ld hl, $cee3
	and a
	add [hl]
	ld [hl], a
	ld a, [$cee4]
	adc e
	ld [$cee4], a
	ld a, [wc0cd]
	ld e, $0
	bit 7, a
	jr z, .asm_2893
	dec e

.asm_2893
	ld hl, $cee5
	and a
	add [hl]
	ld [hl], a
	ld a, [$cee6]
	adc e
	ld [$cee6], a
	ret
; 0x28a1


data_28a1: ; 0x28a1
INCBIN "baserom.gb", $28a1, $2b2b-$28a1


Function2b2b: ; 0x2b2b
	call Function2bc1
	call Function2ce5
	jr .asm_2b39

	call Function2bc1
	call Function2cea

.asm_2b39
	ld a, $1
	ld [wc10e], a
	call Function3180
	call ReadInputs
	ld hl, hCurInputs
	bit 3, [hl]
	jr nz, .asm_2b6e
	bit 2, [hl]
	jr nz, .asm_2b6e
	call Function83d
	call Function2c3e
	call Function2b6f
	call Function17d6
	ld hl, wc0c1
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

.asm_2b72
	ld hl, $cd5a
	add hl, bc
	ld a, [hl]
	ld [wc0cd], a
	ld hl, $cd78
	add hl, bc
	ld a, [hl]
	ld [wc0cf], a
	ld a, [wc104]
	and $3
	jr nz, .asm_2ba5
	ld hl, $cdb4
	add hl, bc
	ld a, [hl]
	ld hl, $cd5a
	add hl, bc
	add [hl]
	ld [hl], a
	ld [wc0cd], a
	ld hl, $cdc3
	add hl, bc
	ld a, [hl]
	ld hl, $cd78
	add hl, bc
	add [hl]
	ld [hl], a
	ld [wc0cf], a

.asm_2ba5
	push bc
	ld a, [wc0ca]
	or $80
	ld [wc0ca], a
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
	jp c, .asm_2b72
	ret
; 0x2bc1


Function2bc1: ; 0x2bc1
	xor a
	ld [$cee1], a

.asm_2bc5
	ld a, [$cee1]
	ld c, a
	add a
	add a
	add c
	ld c, a
	ld b, $0
	ld hl, data_2c20
	add hl, bc
	ld a, [hli]
	ld [wc0cd], a
	ld a, [hli]
	ld [wc0cf], a
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
	ld a, [wc0cd]
	ld [hl], a
	ld hl, $cdb4
	add hl, bc
	ld a, [wc0cf]
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
	jp c, .asm_2bc5
	ret
; 0x2c20


data_2c20: ; 0x2c20
INCBIN "baserom.gb", $2c20, $2c3e-$2c20


Function2c3e: ; 0x2c3e
	ld bc, $0007
	ld hl, $cd5a
	add hl, bc
	ld a, [hl]
	ld [wc0cd], a
	ld hl, $cd78
	add hl, bc
	ld a, [hl]
	ld [wc0cf], a
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
	ld [wc0cd], a
	ld hl, $cdc3
	add hl, bc
	ld a, [hl]
	ld hl, $cd78
	add hl, bc
	add [hl]
	ld [hl], a
	ld [wc0cf], a

.asm_2c92
	ld hl, $cdf0
	add hl, bc
	ld a, [hl]
	ld e, a
	ld a, [wc104]
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
	ld [wc0cd], a
	ld a, [hli]
	ld [wc0cf], a
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
	ld a, [wc0cd]
	ld [hl], a
	ld hl, $cdb4
	add hl, bc
	ld a, [wc0cf]
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
	ld [wc10e], a
	call Function3180
	call ReadInputs
	ld hl, hCurInputs
	bit 3, [hl]
	jr nz, .asm_2e6c
	bit 2, [hl]
	jr nz, .asm_2e6c
	ld a, [wc0df]
	cp $0
	jr z, .asm_2e52
	ld a, [wc0de]
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
	ld a, [wc0de]
	ld c, $1
	ld b, $2
	call Function101e
	ld hl, wc10f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	dec hl
	ld a, l
	ld [wc10f], a
	ld a, h
	ld [$c110], a

.asm_2e52
	call Function2e6f
	call Function17d6
	ld hl, wc0c1
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
	ld [wc0ca], a
	ld a, $4b
	ld [wc0cd], a
	ld a, $46
	ld [wc0cf], a
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
	ld [wc0cd], a
	ld a, [hli]
	ld [wc0cf], a
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
	ld [wc0c6], a
	xor a
	ld [wc0c7], a
	call Functione41
	ld bc, $0001
	call Function1752
	call Function15af
	ld a, $13
	ld [wc0c6], a
	ld a, [wc0de]
	srl a
	srl a
	srl a
	and $7
	ld c, a
	ld b, $0
	ld hl, data_2f4c
	add hl, bc
	ld a, [hl]
	ld [wc0c7], a
	cp $ff
	jr z, .asm_2f4b
	ld a, [wc0df]
	and a
	jr nz, .asm_2f30
	ld a, [wc0de]
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
	ld a, [wc0de]
	and $f
	jr nz, .asm_2f4b
	ld a, Sound_12
	jp FarCall_StartMusic

.asm_2f3f
	jp Function31b3

.asm_2f42
	cp $3d
	jr nz, .asm_2f4b
	ld a, Sound_13
	call FarCall_StartMusic

.asm_2f4b
	ret
; 0x2f4c


data_2f4c: ; 0x2f4c
INCBIN "baserom.gb", $2f4c, $2f7b-$2f4c


Function2f7b: ; 0x2f7b
	ld a, $1
	ld [wc10e], a
	call Function3180
	call ReadInputs
	ld a, [$c0fd]
	cp $0
	ld hl, hCurInputs
	bit 2, [hl]
	jr nz, .asm_2fc7
	bit 3, [hl]
	jr nz, .asm_2fc7
	xor a
	ld [wc0ca], a
	ld a, $4b
	ld [wc0cd], a
	ld a, $3f
	ld [wc0cf], a
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
	ld hl, wc0c1
	ld [hl], $0
	inc hl
	ld [hl], $c0
	call Function30e2
	jp Function2f7b

.asm_2fc7
	ret
; 0x2fc8


data_2fc8: ; 0x2fc8 Cutscenes
dw $2FDA, $2FF0, $3024, $302B, $3044, $304E, $305B, $3083, $309F

data_2fda: ; 0x2fda

INCBIN "baserom.gb", $2fda, $30d9-$2fda


data_30d9: ; 0x30d9
db 0, 1, 1, 1, 1, 2, 2, 2, 3


Function30e2: ; 0x30e2
	ld hl, wc104
	inc [hl]

.asm_30e6
	ld a, [hff8c]
	and a
	jr z, .asm_30e6
	xor a
	ld [hff8c], a
	ld a, [wc10e]
	or a
	jr nz, .asm_30e6

	ret
; 0x30f5


Function30f5: ; 0x30f5
	ld [$c0fd], a
	ld l, a
	ld h, $0
	add hl, hl
	ld de, data_2fc8
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
	ld de, data_2fc8
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


Function316f_ResetHRam: ; 0x316f
	ld a, $0
	ld b, $3e
	ld hl, hffa0

.asm_3176
	ld [hli], a
	dec b
	jp nz, .asm_3176

	ld a, $47
	ld [hffa0], a
	ret
; 0x3180


Function3180: ; 0x3180
	push af
	push bc
	push de
	push hl
	ld a, [hffa1]
	ld b, a
	ld a, [wc105]
	cp b
	jr z, .asm_319f

	ld [hffa1], a
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


; Input:
; a = SongNr
FarCall_StartMusic: ; 0x31a4
	ld b, a
	ld a, Bank(StartMusic)
	ld [MBC1RomBank], a
	ld a, b

	call StartMusic

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


Function31e0: ; 0x31e0
	ld a, $d
	ld [$cf06], a
	ld a, $5
	ld [$cf07], a
	ld bc, $0001
	call Function3217.asm_3245
	ld hl, $cf07
	inc [hl]
	ld b, $0
	ld a, [wc0e8]
	add $30
	ld c, a
	call Function3437
	ld hl, $cf07
	inc [hl]
	ld hl, data_350a
	ld bc, $0000
	call Function3217.asm_3248
	ld b, $0
	ld a, [SubLevelNr]
	add $30
	ld c, a
	jp Function3437
; 0x3217


Function3217: ; 0x3217
	ld a, $f
	ld [$cf06], a
	ld a, $2
	ld [$cf07], a
	jr .asm_3245

	ret

	ld a, [$4000]
	push af

	ld a, Bank(Function1427a)
	ld [MBC1RomBank], a
	call Function1427a

	pop af
	ld [MBC1RomBank], a
	ld a, $f
	ld [$cf06], a
	ld a, $1
	ld [$cf07], a
	ld hl, $cf1a
	ld c, l
	ld b, h
	jr .asm_324d

.asm_3245
	ld hl, data_34c9

.asm_3248
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]

.asm_324d
	ld a, [bc]
	inc bc
	cp $0
	jr z, .asm_325f
	push bc
	call Function3437
	pop bc
	ld hl, $cf07
	inc [hl]
	jp .asm_324d

.asm_325f
	ret
; 0x3260


Function3260: ; 0x3260
	ld a, $11
	ld [$cf06], a
	ld a, $2
	ld [$cf07], a
	ld hl, PasswordStrings
	ld bc, $0000
	call Function3217.asm_3248
	ld b, $0
	ld a, [wc0e8]
	dec a
	ld c, a
	ld hl, PasswordStrings
	jp Function3217.asm_3248
; 0x3280


Function3280: ; 0x3280
	ld a, [wcaf6]
	and $f
	ld bc, $0003
	call Function3334
	ld a, [wcaf6]
	srl a
	srl a
	srl a
	srl a
	ld bc, $0002
	call Function3334
	ld d, $0
	ld a, [wc0e6]
	dec a
	cp $a
	jr c, .asm_32ae
	dec d
.asm_32a7
	inc d
	sub $a
	jr nc, .asm_32a7
	add $a

.asm_32ae
	ld bc, $0026
	call Function3334
	ld a, d
	dec bc
	call Function3334
	ld a, $a
	dec bc
	call Function3334
	ld a, [$c0e3]
	and $f
	ld bc, $0008
	call Function3334
	ld a, [$c0e3]
	srl a
	srl a
	srl a
	srl a
	ld bc, $0007
	call Function3334
	ld a, [$c0e2]
	and $f
	ld bc, $000a
	call Function3334
	ld a, [$c0e2]
	srl a
	srl a
	srl a
	srl a
	ld bc, $0009
	call Function3334
	ld a, $0
	ld bc, $000b
	call Function3334
	ld a, $0
	ld bc, $000c
	call Function3334
	ld a, [wc0dc]
	and $f
	ld bc, $0012
	call Function3334
	ld a, [wc0dc]
	srl a
	srl a
	srl a
	srl a
	ld bc, $0011
	call Function3334
	ld a, $c
	ld bc, $0010
	call Function3334
	ld a, $d
	ld bc, $0001
	call Function3334
	ret
; 0x3334


Function3334: ; 0x3334
	ld hl, $cf2e
	add [hl]
	inc a
	ld hl, StatusDisplay
	add hl, bc
	ld [hl], a
	ret
; 0x333f


Function333f: ; 0x333f
	ld c, $34
	ld a, [$cf2e]
	ld e, a
	ld hl, StatusDisplay
.asm_3348
	ld a, e
	ld [hli], a
	dec c
	ld a, c
	and a
	jr nz, .asm_3348
	ld a, [wc0e8]
	ld bc, $002d
	call Function3334
	ld a, [SubLevelNr]
	ld bc, $002f
	call Function3334
	ld a, $b
	ld bc, $002e
	call Function3334
	ret
; 0x336a


Function336a: ; 0x336a
	ld a, [$cf0a]
	cp $1
	jr z, .asm_337a
	cp $2
	jr z, .asm_33be
	cp $3
	jr z, .asm_337a
	ret

.asm_337a
	ld a, [$cf08]
	ld [$cf06], a
	ld a, [$cf09]
	ld [$cf07], a
	ld a, [$cf0b]
	ld l, a
	ld a, [$cf0c]
	ld h, a
	ld a, [hl]
	inc hl
	push af
	ld a, l
	ld [$cf0b], a
	ld a, h
	ld [$cf0c], a
	pop af
	cp $0
	jr z, .asm_33a9
	call Function3437
	ld a, [$cf07]
	inc a
	ld [$cf09], a
	ret

.asm_33a9
	ld a, [$cf0a]
	cp $1
	jr nz, .asm_33b6
	ld a, $2
	ld [$cf0a], a
	ret

.asm_33b6
	xor a
	ld [$cf0a], a
	ld [$c0eb], a
	ret

.asm_33be
	ld a, $f
	ld [$cf06], a
	ld a, $b
	ld [$cf07], a
	ld bc, $0000
.asm_33cb
	ld hl, $cf0f
	add hl, bc
	ld a, c
	ld e, a
	ld a, [$cf13]
	and $3
	cp e
	jr nz, .asm_33e4
	ld a, [wc104]
	and $8
	jr nz, .asm_33e4
	ld a, $20
	jr .asm_33e7

.asm_33e4
	ld a, [hl]
	add $41

.asm_33e7
	push bc
	call Function3437
	pop bc
	ld hl, $cf07
	inc [hl]
	inc bc
	ld a, c
	cp $4
	jr nz, .asm_33cb
	ret
; 0x33f7


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


Function3437: ; 0x3437
	sub $20
	add $6a
	ld e, a
	xor a
	adc $34
	ld d, a
	ld a, [de]
	ld [$cf0e], a
	xor a
	ld b, a
	ld a, [$cf06]
	add b
	ld e, a
	ld d, $0
	ld hl, data_34a5
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld e, a
	add hl, de
	ld a, [$cf07]
	ld e, a
	add hl, de
	ld a, l
	ld [$cf19], a
	ld a, h
	ld [$cf1a], a
	ld a, [$cf0e]
	ld [hl], a
	ret
; 0x346a


INCBIN "baserom.gb", $346a, $34a5-$346a

data_34a5: ; 0x34a5

INCBIN "baserom.gb", $34a5, $34c9-$34a5


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
	dw .data_350c

.data_350c ; 0x350c
	db "-", 0, "STORYBOARDS", 0, " KEITH ROBINSON", 0, "MUSIC", 0, " DAVE HAYES", 0, "ARRANGED BY", 0, " DAVE WARHOL", 0, " PRODUCED BY", 0, "  DAVE WARHOL", 0, " FOR", 0, "  REALTIME", 0, "  ASSOCIATES", 0, "                 ", 0

PasswordStrings: ; 0x359f
	dw .data_35b1, .PasswordW2, .PasswordW3, .PasswordW4, .PasswordW5, .PasswordW6, .PasswordW7, .PasswordW8, .PasswordW1

.data_35b1 ; 0x35b1
	db "PASSWORD: ", 0

.PasswordW2 ; 0x35bc
	db "MNDC", 0

.PasswordW3 ; 0x35c1
	db "MRGT", 0

.PasswordW4 ; 0x35c6
	db "SHPH", 0

.PasswordW5 ; 0x35cb
	db "JMMC", 0

.PasswordW6 ; 0x35d0
	db "DHYS", 0

.PasswordW7 ; 0x35d5
	db "LNRD", 0

.PasswordW8 ; 0x35da
	db "DVBN", 0

.PasswordW1 ; 0x35df
	db "WRHL", 0


Function35e4: ; 0x35e4
	push af
	ld a, $a6
	ld [rWX], a
	ld a, $1
	jr .asm_35ed

.asm_35ed
	ld [$cf33], a
.asm_35f0
	ld a, [rLY]
	cp $92
	jr c, .asm_35f0
	xor a
	ld [rWY], a
	ld a, $e1
	ld [rLCDC], a
	xor a
	ld [$cf36], a
	ld a, $1
	ld [$cf38], a
.asm_3606
	call Function3619
	ld hl, $cf36
	inc [hl]
	ld a, [$cf38]
	and a
	jr nz, .asm_3606
	ld a, $0
	ld [rBGP], a
	pop af
	ret
; 0x3619


Function3619: ; 0x3619
	ld a, [$cf38]
	jr z, .asm_3648
	ld a, [$cf36]
	and $3f
	jr nz, .asm_3648
	ld a, [rWX]
	ld c, a
	ld hl, $cf33
	bit 0, [hl]
	jr z, .asm_3636
	dec a
	cp $9
	jr c, .asm_363c
	jr .asm_3646

.asm_3636
	ld a, c
	inc a
	cp $a3
	jr c, .asm_3646

.asm_363c
	xor a
	ld [$cf38], a
	ld a, $83
	ld [rLCDC], a
	ld a, $a6

.asm_3646
	ld [rWX], a

.asm_3648
	ret
; 0x3649


Function3649: ; 0x3649
	ld hl, data_3717
	ld a, $e4
	ld b, a
	ld [$cf3a], a
	ld d, $0
	xor a
	ld [$cf3b], a
	ld a, $c
	ld [$cf36], a
	xor a
	ld [$cf34], a
	ld e, a
	ld a, $32
	ld [$cf37], a
	ld a, $1
	ld [$cf34], a
	ld a, $92
	ld [rLY], a
	call Function367a
	ld a, $d0
	ld [rOBP0], a
	ld [rOBP1], a
	ret
; 0x367a


Function367a: ; 0x367a
	ld a, [$cf34]
	ld c, a
.asm_367e
	ld a, [rLY]
	cp c
	jr nz, .asm_367e
	and $8
	jr z, .asm_3690
	ld a, $e4
	ld b, a
	ld d, $0
	ld a, d
	ld [rBGP], a
	jp hl

.asm_3690
	ld a, $e4
	ld d, a
	ld b, $0
	ld a, d
	ld [rBGP], a
	jp hl
; 0x3699


data_3699: ; 0x3699
INCBIN "baserom.gb", $3699, $36cc-$3699


Function36cc: ; 0x36cc
	ld a, b
	ld [rBGP], a
	ld a, [$cf34]
	inc a
	cp $90
	jr c, .asm_36ff
	inc e
	ld a, e
	and $1
	jr nz, .asm_36fe
	ld a, [$cf37]
	dec a
	ld [$cf37], a
	ld a, [$cf36]
	inc a
	push bc
	ld b, $0
	ld c, a
	ld hl, data_3699
	add hl, bc
	pop bc
	ld [$cf36], a
	cp $32
	jr c, .asm_36fe
	xor a
	ld [$cf38], a
	jr .asm_3716

.asm_36fe
	xor a

.asm_36ff
	ld [$cf34], a
	and $8
	jp nz, Function367a
	ld a, [$cf37]
	push bc
	ld b, $0
	ld c, a
	ld hl, data_3717
	add hl, bc
	pop bc
	jp Function367a

.asm_3716
	ret
; 0x3717


data_3717: ; 0x3717
INCBIN "baserom.gb", $3717, $374a-$3717


Function374a: ; 0x374a
	ld a, b
	ld [rBGP], a
	ld a, [$cf34]
	inc a
	cp $90
	jr c, .asm_3776
	inc e
	ld a, e
	and $1
	jr nz, .asm_3775
	ld a, [$cf37]
	dec a
	push bc
	ld b, $0
	ld c, a
	ld hl, data_3717
	add hl, bc
	pop bc
	ld [$cf37], a
	cp $1
	jr nc, .asm_3775
	xor a
	ld [$cf38], a
	jr .asm_378d

.asm_3775
	xor a

.asm_3776
	ld [$cf34], a
	and $8
	jp z, Function367a
	ld a, [$cf36]
	push bc
	ld b, $0
	ld c, a
	ld hl, data_3699
	add hl, bc
	pop bc
	jp Function367a

.asm_378d
	ret
; 0x378e


INCBIN "baserom.gb", $378e, $3fdf-$378e


Function3fdf: ; 0x3fdf
	ld a, [$c0ac]
	ld [$cf2e], a
	ld de, $3e3a
	call Function141c
	ld hl, $c0b0
	ld [hl], $0
	inc hl
	ld [hl], $98
	jp Function12e5
; 0x3ff6


INCBIN "baserom.gb", $3ff6, $4000-$3ff6
