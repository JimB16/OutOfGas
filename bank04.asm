

SECTION "bank4", ROMX, BANK[$4]

Bank4Start: ; 4:4000
db 4


data_44001: ; 4:4001
INCBIN "build/data/5-8.rle"

data_44541: ; 4:4541
INCBIN "build/data/6-2.rle"

data_447c0: ; 4:47c0
INCBIN "build/data/6-3.rle"

data_44b7d: ; 4:4b7d
INCBIN "build/data/6-4.rle"

data_44e7d: ; 4:4e7d
INCBIN "build/data/6-5.rle"

data_454d4: ; 4:54d4
INCBIN "build/data/6-6.rle"

data_4588c: ; 4:588c
INCBIN "build/data/6-7.rle"

data_45cf2: ; 4:5cf2
INCBIN "build/data/6-8.rle"

data_46115: ; 4:6115
INCBIN "build/data/7-1.rle"

data_4638e: ; 4:638e
INCBIN "build/data/7-2.rle"

data_46539: ; 4:6539
INCBIN "build/data/7-3.rle"

data_46821: ; 4:6821
INCBIN "build/data/7-4.rle"

data_46be1: ; 4:6be1
INCBIN "build/data/7-5.rle"

data_46ec9: ; 4:6ec9
INCBIN "build/data/7-6.rle"

data_47312: ; 4:7312
INCBIN "build/data/7-7.rle"

data_478ce: ; 4:78ce
INCBIN "build/data/7-8.rle"

data_47afc: ; 4:7afc
INCBIN "build/data/8-1.rle"


data_47fad: ; 4:7fad
INCBIN "baserom.gb", 16384*4+$3fad, $4000-$3fad
