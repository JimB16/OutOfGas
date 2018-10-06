
; http://otakunozoku.com/RGBDSdocs/fix.htm

INCLUDE "gbhw.asm"
INCLUDE "enum.asm"
INCLUDE "hram.asm"
INCLUDE "macros.asm"
INCLUDE "charmap.asm"


MaxLevelNr   EQU 8*8

Sound_12     EQU $12
Sound_13     EQU $13
Sound_15     EQU $15
Sound_3e     EQU $3e
Sound_47     EQU $47
Sound_4f     EQU $4f
Sound_80     EQU $80
Sound_81     EQU $81
Sound_82     EQU $82
Sound_84     EQU $84
Sound_85     EQU $85


INCLUDE "rst.asm"


SECTION "Header", ROM0[$100]
Start::
	nop
	jp _Start
; 0x104

INCLUDE "start.asm"


;INCLUDE "bank06.asm"

;INCLUDE "bank07.asm"



INCLUDE "bank01.asm"

INCLUDE "bank02.asm"

INCLUDE "bank03.asm"

INCLUDE "bank04.asm"

INCLUDE "bank05.asm"


SECTION "bank6", ROMX, BANK[$6]

INCBIN "baserom.gb", 16384*6, $4000

SECTION "bank7", ROMX, BANK[$7]

INCBIN "baserom.gb", 16384*7, $4000
