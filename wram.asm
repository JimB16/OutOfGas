;INCLUDE "includes.asm"

;flag_array: MACRO
;	ds ((\1) + 7) / 8
;ENDM



SECTION "CHR0", VRAM [$8000], BANK [0]
v8000:: ds $8400-$8000
v8400:: ds $8460-$8400
v8460:: ds $8480-$8460
v8480::
SECTION "CHR1", VRAM [$8800], BANK [0]
v8800::
SECTION "v8e00", VRAM [$8e00], BANK [0]
v8e00::
SECTION "CHR2", VRAM [$9000], BANK [0]
VTiles2:: ds $96c0-$9000
v96c0:: ds $96d0-$96c0
v96d0::
SECTION "BG0",  VRAM [$9800], BANK [0]
VBGMap0::
SECTION "BG1",  VRAM [$9C00], BANK [0]
VBGMap1::
SECTION "STATUSDISPLAY",  VRAM [$9E40], BANK [0]
StatusDisplay::



SECTION "WRAM 0", WRAM0
wc000:: ; 0xc000
	ds $c1
wc0c1:: ; 0xc0c1
	ds $1
wc0c2:: ; 0xc0c2
	ds $1
wc0c3:: ; 0xc0c3
	ds $3
wc0c6:: ; 0xc0c6
	ds $1
wc0c7:: ; 0xc0c7
	ds $1
wc0c8:: ; 0xc0c8
	ds $1
wc0c9:: ; 0xc0c9
	ds $1
wc0ca:: ; 0xc0ca
	ds $3
wc0cd:: ; 0xc0cd
	ds $1
wc0ce:: ; 0xc0ce
	ds $1
wc0cf:: ; 0xc0cf
	ds $a
wc0d9:: ; 0xc0d9
	ds $2
wc0db:: ; 0xc0db
	ds $1
wc0dc:: ; 0xc0dc
	ds $1
wc0dd:: ; 0xc0dd
	ds $1
wc0de:: ; 0xc0de
	ds $1
wc0df:: ; 0xc0df
	ds $1
wc0e0:: ; 0xc0e0
	ds $1
wc0e1:: ; 0xc0e1
	ds $4
wc0e5:: ; 0xc0e5
	ds $1
wc0e6:: ; 0xc0e6
	ds $2
wc0e8:: ; 0xc0e8
	ds $1
SubLevelNr:: ; 0xc0e9
	ds $1 ; 1 - 9
wc0ea:: ; 0xc0ea
	ds $a
wc0f4:: ; 0xc0f4
	ds $b
Stack:: ; wc0ff
	ds 1

wc100:: ds 1
wc101:: ds 1
wc102:: ds 1
wc103:: ds 1
wc104:: ds 1
wc105:: ds 1
wc106:: ds 1
wc107:: ds 1
wc108:: ds 1
wc109:: ds 1
wc10a:: ds 1
wc10b:: ds 1
wc10c:: ds 1
wc10d:: ds 1
wc10e:: ds 1
wc10f:: ds $11f-$10f
wLevelNr:: ds 1 ; 0xc11f 0 - 64
wc120:: ds $af1-$120
wcaf1_NrOfObjects:: ds 1
wcaf2_RomBank:: ds 1
wcaf3:: ds 1
wcaf4:: ds 1
wcaf5:: ds 1
wcaf6:: ds 1
wcaf7:: ds $ccfb-$caf7
wccfb:: ds 1
wccfc:: ds 1


SECTION "WRAM 1", WRAMX, BANK [1]

wd000:: ds $168
wd168:: ds $400-$168
wd400:: ds 1
wd401:: ds 1 ; Destination data byte 1: 00 - overworld, 01 - dungeon, 02 - side view area
wd402:: ds 1 ; Destination data byte 2: Values from 00 to 1F accepted. FF is Color Dungeon
wd403:: ds 1 ; Destination data byte 3: Room number. Must appear on map or it will lead to an empty room
wd404:: ds 2 ; Destination data X and Y co-ordinates
wd406:: ds $d416-$d406
wd416:: ds 1
wd417:: ds $d45f-$d417
wd45f:: ds 1
wd460:: ds $d471-$d460
wd471:: ds $d47a-$d471
wd47a:: ds $d47c-$d47a
wd47c:: ds $d600-$d47c
wd600:: ds 1
wd601:: ds $d700-$d601
wd700:: ds $d800-$d700
wd800:: ds $dfff-$d800
wdfff:: ds 1


SECTION "Party", WRAMX, BANK [1]

wPokemonData::




SECTION "Scratch", SRAM, BANK [0]

sScratch::


SECTION "SRAM Bank 0", SRAM [$a600], BANK [0]

s0_a600:: ds $11a
s0_a71a:: ds $11a
s0_a834:: ds $1d7
s0_aa0b:: ds $1d7

s0_abe2:: ds 1
s0_abe3:: ds 1
s0_abe4:: ds 1
s0_abe5:: ds 1
s0_abe6:: ds 10
s0_abf0:: ds 10
s0_abfa:: ds 2
