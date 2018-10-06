

SECTION "bank5", ROMX, BANK[$5]

Bank5Start: ; 5:4000
db 5


data_54001: ; 5:4001
INCBIN "build/data/8-2.rle"

data_5423c: ; 5:423c
INCBIN "build/data/8-3.rle"

data_54881: ; 5:4881
INCBIN "build/data/8-4.rle"

data_54b72: ; 5:4b72
INCBIN "build/data/8-5.rle"

data_54e2e: ; 5:4e2e
INCBIN "build/data/8-6.rle"

data_552f5: ; 5:52f5
INCBIN "build/data/8-7.rle"

data_55593: ; 5:5593
INCBIN "build/data/8-8.rle"



data_5589d: ; 5:589d
	Object $0A, $8B, $110
	Object $0A, $8B, $130
	Object $0A, $CB, $D0
	Object $0A, $CB, $170
	Object $3C, $115, $193
	Object $3C, $115, $B3
	Object $3D, $155, $D3
	Object $3D, $155, $173
	Object $3D, $175, $D3
	Object $3D, $175, $173
	Object $3C, $1B5, $B3
	Object $3C, $1B5, $193
	Object $0A, $1EB, $D0
	Object $0A, $1EB, $170
	Object $0A, $22B, $110
	Object $0A, $22B, $130

data_558ed: ; 5:58ed
	Object $0B, $AB, $B0
	Object $0D, $AB, $130
	Object $0F, $AB, $1B0
	Object $11, $AB, $230
	Object $13, $AB, $2B0
	Object $04, $103, $1F2
	Object $04, $103, $272
	Object $04, $104, $F6
	Object $04, $104, $172
	Object $0C, $16B, $F0
	Object $0E, $16B, $170
	Object $12, $16B, $270
	Object $10, $16B, $1F0

data_5592E: ; 5:592e

INCBIN "baserom.gb", 16384*5+$192e, $19bf-$192e

data_559BF: ; 5:59bf

INCBIN "baserom.gb", 16384*5+$19bf, $1a05-$19bf

data_55A05: ; 5:5a05

INCBIN "baserom.gb", 16384*5+$1a05, $1a64-$1a05

data_55A64: ; 5:5a64

INCBIN "baserom.gb", 16384*5+$1a64, $1b27-$1a64

data_55B27: ; 5:5b27

INCBIN "baserom.gb", 16384*5+$1b27, $1b81-$1b27

data_55B81: ; 5:5b81

INCBIN "baserom.gb", 16384*5+$1b81, $1bd6-$1b81

data_55BD6: ; 5:5bd6

INCBIN "baserom.gb", 16384*5+$1bd6, $1c26-$1bd6

data_55C26: ; 5:5c26

INCBIN "baserom.gb", 16384*5+$1c26, $1c5d-$1c26

data_55C5D: ; 5:5c5d

INCBIN "baserom.gb", 16384*5+$1c5d, $1d0c-$1c5d

data_55D0C: ; 5:5d0c

INCBIN "baserom.gb", 16384*5+$1d0c, $1d84-$1d0c

data_55D84: ; 5:5d84

INCBIN "baserom.gb", 16384*5+$1d84, $1dc5-$1d84

data_55DC5: ; 5:5dc5

INCBIN "baserom.gb", 16384*5+$1dc5, $345e-$1dc5

data_5745e: ; 5:745e

INCBIN "baserom.gb", 16384*5+$345e, $4000-$345e

