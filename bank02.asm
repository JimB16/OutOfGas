

SECTION "bank2", ROMX, BANK[$2]


Unknown_2_4000: ; 2:4000
	db 2


Function24001: ; 2:4001
	jp Function24035
; 0x8004


Function24004: ; 2:4004
	jp Function2430b
; 0x8007


Function24007: ; 2:4007
	jp Function24027
; 0x800a


Function2400a: ; 2:400a
	jp Function2401a
; 0x800d


ResetAndFullVolume: ; 2:400d
	call TurnAllSoundOff

	xor a
	ld [$ffa3], a
	ld [$ffb4], a

	ld a, $77
	ld [rNR50], a
	ret
; 0x801a


Function2401a: ; 2:401a
	push af
	ld a, $1
	ld [$ffb4], a
	xor a
	call TurnAllSoundOff

	pop af
	jp Function2430b
; 0x8027


Function24027: ; 2:4027
	xor a
	ld [$ffb1], a
	ld [$ffa3], a

TurnAllSoundOff: ; 2:402c
	call ResetAllSoundRegisters
	ld [rNR52], a
	dec a
	ld [rNR52], a
	ret
; 0x8035


Function24035: ; 2:4035
	call Function2403c
	call Function240f9
	ret
; 0x803c


Function2403c: ; 2:403c
	ld a, [$ffa3]
	or a
	jr nz, .asm_804c
	ld [$ffa7], a
	ld [$ffa8], a
	ld [$ffa9], a
	ld [$ffaa], a
	ld [$ffab], a
	ret

.asm_804c
	dec a
	ld [$ffa3], a
	ret nz
	ld a, [$ffa4]
	ld l, a
	ld a, [$ffa5]
	ld h, a
.asm_8056
	ld a, [hli]
	cp $0
	jp z, Function240c7
	cp $1
	jr z, .asm_80aa
	cp $2
	jr z, .asm_80a8
	cp $3
	jr z, .asm_8096
	cp $fe
	jr z, .asm_8090
	cp $ff
	jr z, .asm_8080
	sub $4
	ld [$ffa3], a
	jp z, Function240f2
	ld b, a
	ld a, [$ffa6]
	add b
	ld [$ffa3], a
	jp Function240f2

.asm_8080
	call Function243ab
	and [hl]
	inc hl
	ld [$ffa2], a
	call Function243ab
	and [hl]
	inc hl
	ld [$ffa6], a
	jr .asm_8056

.asm_8090
	ld a, [hli]
	ld e, a
	ld h, [hl]
	ld l, e
	jr .asm_8056

.asm_8096
	ld a, [hli]
	ld [rNR41], a
	ld a, [hli]
	ld [rNR42], a
	ld a, [hli]
	ld [rNR43], a
	ld a, [hli]
	ld [rNR44], a
	ld a, $ff
	ld [$ffaa], a
	jr .asm_8056

.asm_80a8
	jr .asm_8056

.asm_80aa
	ld a, [hli]
	ld [rNR21], a
	ld a, [hli]
	ld [rNR22], a
	ld a, [$ffa2]
	ld b, a
	or a
	ld a, [hli]
	add b
	ld [rNR23], a
	ld a, $0
	adc [hl]
	inc hl
	and $c7
	ld [rNR24], a
	ld a, $ff
	ld [$ffa8], a
	jp .asm_8056
; 0x80c7


Function240c7: ; 2:40c7
	ld a, $1
	ld [rNR10], a
	xor a
	ld [rNR11], a
	ld [rNR12], a
	ld [rNR14], a
	ld a, [hli]
	ld [rNR10], a
	ld a, [hli]
	ld [rNR11], a
	ld a, [hli]
	ld [rNR12], a
	ld a, [$ffa2]
	ld b, a
	or a
	ld a, [hli]
	add b
	ld [rNR13], a
	ld a, $0
	adc [hl]
	inc hl
	and $c7
	ld [rNR14], a
	ld a, $ff
	ld [$ffa7], a
	jp Function2403c.asm_8056
; 0x80f2


Function240f2: ; 2:40f2
	ld a, l
	ld [$ffa4], a
	ld a, h
	ld [$ffa5], a
	ret
; 0x80f9


Function240f9: ; 2:40f9
	ld a, [$ffb4]
	or a
	ret nz
	ld a, [$ffb1]
	or a
	jp nz, Function2410b
	ld a, [rNR52]
	and $f
	jp nz, Function241dd
	ret
; 0x810b


Function2410b: ; 2:410b
	dec a
	ld [$ffb1], a
	jp nz, Function241dd
	ld a, [$ffaf]
	ld l, a
	ld a, [$ffb0]
	ld h, a

Function24117: ; 2:4117
	ld a, [$ffac]
	ld b, a
	ld a, [hl]
	cp $fe
	jp z, Function241d8
	jp nc, Function241dd
	sub b
	jp c, Function2413d
	sub $10
	jp c, Function24188
	sub $10
	jp c, Function241c7
	ld [$ffb1], a
	inc hl
	ld a, l
	ld [$ffaf], a
	ld a, h
	ld [$ffb0], a
	jp Function241dd
; 0x813d


Function2413d: ; 2:413d
	add b
	inc hl
	push hl
	ld e, a
	ld d, $0
	ld a, [$ffad]
	ld l, a
	ld a, [$ffae]
	ld h, a
	add hl, de
	ld c, [hl]
	ld b, d
	ld a, [$ffac]
	ld e, a
	add hl, de
	ld a, [hl]
	sub $3
	push af
	ld hl, $ffce
	add hl, bc
	ld c, [hl]
	ld hl, $44c4
	add hl, bc
	ld e, [hl]
	ld hl, $ffc8
	ld a, c
	cp $48
	jp nc, Function24178
	ld hl, $44c0
	swap c
	srl c
	ld a, c
	and $3
	ld c, a
	add hl, bc
	ld c, [hl]
	ld hl, $ffb6
	add hl, bc

Function24178: ; 2:4178
	ld a, $1
	ld [hli], a
	ld a, e
	ld [hli], a
	pop af
	ld [hli], a
	inc hl
	inc hl
	ld a, $1
	ld [hl], a
	pop hl
	jp Function24117
; 0x8188


Function24188: ; 2:4188
	add $10
	inc hl
	push hl
	ld c, a
	ld b, $0
	ld hl, $ffce
	add hl, bc
	ld c, [hl]
	ld hl, $450e
	add hl, bc
	ld e, [hl]
	ld a, e
	or a
	jp z, Function241c3
	ld hl, $ffc8
	ld a, c
	cp $48
	jp nc, Function241b8
	ld hl, $44c0
	swap c
	srl c
	ld a, c
	and $3
	ld c, a
	add hl, bc
	ld c, [hl]
	ld hl, $ffb6
	add hl, bc

Function241b8: ; 2:41b8
	ld a, $1
	ld [hli], a
	ld a, e
	ld [hli], a
	inc hl
	inc hl
	inc hl
	ld a, $1
	ld [hl], a

Function241c3: ; 2:41c3
	pop hl
	jp Function24117
; 0x81c7


Function241c7: ; 2:41c7
	add $10
	inc hl
	ld c, a
	ld b, $0
	ld a, [hli]
	push hl
	ld hl, $ffce
	add hl, bc
	ld [hl], a
	pop hl
	jp Function24117
; 0x81d8


Function241d8: ; 2:41d8
	inc hl
	ld a, [hl]
	jp Function2430b
; 0x81dd


Function241dd: ; 2:41dd
	ld bc, $ffb6
	ld de, $0000

Function241e3: ; 2:41e3
	ld a, [bc]
	or a
	jp z, Function242fd
	dec a
	ld [bc], a
	jp nz, Function242fd
	ld hl, $ffa7
	add hl, de
	ld a, [hl]
	or a
	jp z, Function241fb
	xor a
	ld [bc], a
	jp Function242fd
; 0x81fb


Function241fb: ; 2:41fb
	push bc
	push de
	ld hl, $44b8
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	inc bc
	ld a, [bc]
	inc bc
	ld hl, $4558
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	add hl, de
	sla e
	rl d
	add hl, de
	ld d, h
	ld e, l
	ld a, [de]
	inc de
	bit 0, a
	jp z, Function24246
	push af
	ld a, [bc]
	inc bc
	ld hl, $4416
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [de]
	inc de
	add [hl]
	inc hl
	ld [bc], a
	inc bc
	ld a, $0
	adc [hl]
	ld l, a
	pop af
	and $80
	or l
	ld [bc], a
	dec bc
	jp Function24250
; 0x8246


Function24246: ; 2:4246
	inc bc
	inc bc
	inc de
	and $80
	ld l, a
	ld a, [bc]
	or l
	ld [bc], a
	dec bc

Function24250: ; 2:4250
	ld h, b
	ld l, c
	ld a, [de]
	inc de
	add [hl]
	ld [hli], a
	ld a, [de]
	inc de
	adc [hl]
	ld [hli], a
	and $38
	jp z, Function24264
	dec hl
	dec hl
	xor a
	ld [hli], a
	ld [hli], a

Function24264: ; 2:4264
	ld b, h
	ld c, l
	ld h, d
	ld l, e
	ld a, [rNR51]
	and [hl]
	inc hl
	or [hl]
	inc hl
	ld [rNR51], a
	ld d, h
	ld e, l
	ld hl, sp+$4
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [bc]
	or a
	jp z, Function2428c
	dec a
	ld [bc], a
	jp nz, Function2428c
	ld a, [de]
	inc de
	ld [hl], a
	ld a, [de]
	ld [bc], a
	jp Function2428d
; 0x828c


Function2428c: ; 2:428c
	inc de

Function2428d: ; 2:428d
	inc de
	pop hl
	ld a, [de]
	inc de
	cp $fd
	jp z, Function242d8
	cp $fe
	jp z, Function242a8
	jp nc, Function242ee
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	jp Function242f1
; 0x82a8


Function242a8: ; 2:42a8
	ld a, [de]
	ld hl, $ffb5
	cp [hl]
	jp z, Function242c7
	ld [hl], a
	ld c, a
	ld b, $0
	ld hl, $43d6
	add hl, bc
	xor a
	ld [rNR30], a
	ld bc, $ff30
	ld d, $10

Function242c0: ; 2:42c0
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jp nz, Function242c0

Function242c7: ; 2:42c7
	ld a, $20
	ld [rNR32], a
	ld a, $80
	ld [rNR30], a
	ld bc, $ffc5
	ld hl, rNR33
	jp Function242f3
; 0x82d8


Function242d8: ; 2:42d8
	ld a, [de]
	inc de
	ld [rNR42], a
	ld a, [de]
	ld e, a
	ld a, [$ffca]
	and $7
	swap a
	or e
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	pop af
	pop af
	ret
; 0x82ee


Function242ee: ; 2:42ee
	inc hl
	inc hl
	inc hl

Function242f1: ; 2:42f1
	dec bc
	dec bc

Function242f3: ; 2:42f3
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	ld [hl], a
	and $7f
	ld [bc], a
	pop de
	pop bc

Function242fd: ; 2:42fd
	ld hl, $0006
	add hl, bc
	ld b, h
	ld c, l
	inc de
	ld a, e
	cp $4
	jp nz, Function241e3
	ret
; 0x830b


Function2430b: ; 2:430b
	ld b, a
	bit 7, a
	jr nz, .asm_836e
	bit 6, a
	jr nz, .asm_8318
	ld a, [$ffab]
	or a
	ret nz

.asm_8318
	xor a
	ld [$ffa3], a
	ld [$ffa2], a
	ld [$ffa6], a
	ld a, [$ffa7]
	or a
	jp z, .asm_832a
	xor a
	ld [rNR12], a
	ld [$ffa7], a

.asm_832a
	ld a, [$ffa8]
	or a
	jp z, .asm_8335
	xor a
	ld [rNR22], a
	ld [$ffa8], a

.asm_8335
	ld a, [$ffa9]
	or a
	jp z, .asm_8340
	xor a
	ld [rNR32], a
	ld [$ffa9], a

.asm_8340
	ld a, [$ffaa]
	or a
	jp z, .asm_834b
	xor a
	ld [rNR42], a
	ld [$ffaa], a

.asm_834b
	ld a, b
	and $40
	ld [$ffab], a
	ld a, b
	and $3f
	add a
	ld e, a
	ld d, $0
	ld hl, $49e4
	add hl, de
	ld a, [hli]
	ld [$ffa4], a
	ld a, [hli]
	ld [$ffa5], a
	ld a, $77
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld a, $1
	ld [$ffa3], a
	ret

.asm_836e
	call ResetAllSoundRegisters
	ld [$ffb1], a
	ld [$ffb3], a
	ld [$ffb4], a
	dec a
	ld [$ffb2], a
	ld [$ffb5], a
	ld a, b
	and $3f
	add a
	ld e, a
	ld d, $0
	ld hl, $49e4
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [$ffac], a
	ld e, a
	ld d, $0
	ld a, l
	ld [$ffad], a
	ld a, h
	ld [$ffae], a
	add hl, de
	add hl, de
	ld a, l
	ld [$ffaf], a
	ld a, h
	ld [$ffb0], a
	ld a, $77
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld a, $1
	ld [$ffb1], a
	ret
; 0x83ab


Function243ab: ; 2:43ab
	push hl
	ld hl, $ffa0
	ld a, [hl]
	rla
	xor [hl]
	and $40
	jr z, .asm_83b7
	ccf

.asm_83b7
	ld a, [hl]
	rla
	ld [hl], a
	pop hl
	ret
; 0x83bc


ResetAllSoundRegisters: ; 2:43bc
	xor a
	ld [rNR12], a
	ld [rNR22], a
	ld [rNR32], a
	ld [rNR42], a
	ld [rNR14], a
	ld [rNR24], a
	ld [rNR34], a
	ld [rNR44], a
	ld [$ffb6], a
	ld [$ffbc], a
	ld [$ffc2], a
	ld [$ffc8], a
	ret
; 0x83d6


INCBIN "baserom.gb", 16384*2+$3d6, $4000-$3d6

