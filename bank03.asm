

SECTION "bank3", ROMX, BANK[$3]

Bank3Start: ; 3:4000
db 3


data_34001: ; 3:4001
INCBIN "build/data/2-8.rle"

data_342a9: ; 3:42a9
INCBIN "build/data/3-1.rle"

data_345ae: ; 3:45ae
INCBIN "build/data/3-2.rle"

data_34939: ; 3:4939
INCBIN "build/data/3-3.rle"

data_34b80: ; 3:4b80
INCBIN "build/data/3-4.rle"

data_34e21: ; 3:4e21
INCBIN "build/data/3-5.rle"

data_34f72: ; 3:4f72
INCBIN "build/data/3-6.rle"

data_35161: ; 3:5161
INCBIN "build/data/3-7.rle"

data_353ed: ; 3:53ed
INCBIN "build/data/3-8.rle"

data_356db: ; 3:56db
INCBIN "build/data/4-1.rle"

data_358d1: ; 3:58d1
INCBIN "build/data/4-2.rle"

data_35a91: ; 3:5a91
INCBIN "build/data/4-3.rle"

data_35c5f: ; 3:5c5f
INCBIN "build/data/4-4.rle"

data_35d87: ; 3:5d87
INCBIN "build/data/4-5.rle"

data_3604a: ; 3:604a
INCBIN "build/data/4-6.rle"

data_36280: ; 3:6280
INCBIN "build/data/4-7.rle"

data_36693: ; 3:6693
INCBIN "build/data/4-8.rle"

data_36852: ; 3:6852
INCBIN "build/data/5-1.rle"

data_36a67: ; 3:6a67
INCBIN "build/data/5-2.rle"

data_36e93: ; 3:6e93
INCBIN "build/data/5-3.rle"

data_3714a: ; 3:714a
INCBIN "build/data/5-4.rle"

data_37467: ; 3:7467
INCBIN "build/data/5-5.rle"

data_3770f: ; 3:770f
INCBIN "build/data/5-6.rle"

data_37b67: ; 3:7b67
INCBIN "build/data/5-7.rle"

data_37d91: ; 3:7d91
INCBIN "build/data/6-1.rle"


data_37f4a: ; 3:7f4a
INCBIN "baserom.gb", 16384*3+$3f4a, $3fe7-$3f4a


data_37fe7: ; 3:7fe7
	Object $0A, $AB, $B0
	Object $0A, $14B, $150
	Object $56, $150, $E0
	Object $0A, $1EB, $B0

data_37ffb: ; 3:7ffb
	Object $00, $126, $BC
