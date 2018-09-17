
; http://otakunozoku.com/RGBDSdocs/fix.htm

INCLUDE "gbhw.asm"
INCLUDE "enum.asm"
INCLUDE "hram.asm"
INCLUDE "macros.asm"
INCLUDE "charmap.asm"


INCLUDE "rst.asm"


SECTION "Header", ROM0[$100]
Start::
	nop
	jp _Start
; 0x104

INCLUDE "start.asm"


;INCLUDE "bank01.asm"

;INCLUDE "bank03.asm"

;INCLUDE "bank04.asm"

;INCLUDE "bank05.asm"

;INCLUDE "bank06.asm"

;INCLUDE "bank07.asm"



SECTION "bank1", ROMX, BANK[$1]

INCBIN "baserom.gb", 16384*1, $4000


INCLUDE "bank02.asm"


SECTION "bank3", ROMX, BANK[$3]

INCBIN "baserom.gb", 16384*3, $4000

SECTION "bank4", ROMX, BANK[$4]

INCBIN "baserom.gb", 16384*4, $4000

SECTION "bank5", ROMX, BANK[$5]

INCBIN "baserom.gb", 16384*5, $4000

SECTION "bank6", ROMX, BANK[$6]

INCBIN "baserom.gb", 16384*6, $4000

SECTION "bank7", ROMX, BANK[$7]

INCBIN "baserom.gb", 16384*7, $4000