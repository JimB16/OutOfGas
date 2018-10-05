PYTHON := python
MD5 := md5sum -c --quiet

.SUFFIXES:
.SUFFIXES: .asm .o .gb .gbc .png .2bpp .1bpp .lz .pal .bin .blk .tilemap
.PHONY: all clean
.SECONDEXPANSION:

poketools := pokemon-reverse-engineering-tools/pokemontools
#gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) $(poketools)/scan_includes.py

oog_obj := \
wram.o \
main.o

all_obj := $(oog_obj)

# object dependencies
$(foreach obj, $(all_obj), \
	$(eval $(obj:.o=)_dep := $(shell $(includes) $(obj:.o=.asm))) \
)


roms := outofgas.gb

all: $(roms)
#crystal: linksawakeningdx.gbc

clean:
	rm -f $(roms) $(all_obj) $(roms:.gb=.map) $(roms:.gb=.sym)
	rm -rf build/*

#compare: linksawakeningdx.gbc pokecrystal11.gbc
#	@$(MD5) roms.md5

rle_files := $(wildcard data/*.rle)
RLE := $(addprefix build/, $(rle_files:.rle=.rle))

%.asm: ;
$(all_obj): $$*.asm $$($$*_dep) $(RLE)
	rgbasm -o $@ $<

build:
	mkdir -p $@

build/data:
	mkdir -p $@


build/data/%.rle: data/%.bin | build/data
	python tools/decompressLevelData.py $< build/data/ -c
	#$(DEVKITARM)/bin/arm-none-eabi-as -mcpu=arm7tdmi -X -mthumb-interwork $< -o $(subst .s,.o,$<)


outofgas.gb: $(oog_obj) | build
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -l 0xce -n 0 -m 0x1 -p 5 -r 0 -t "OUT OF GAS" -j -v $@
	md5sum $@
	hexdump -C baserom.gb > build/baserom.txt
	hexdump -C outofgas.gb > build/outofgas.txt
	diff -u build/baserom.txt build/outofgas.txt | less > build/diff.txt

disassem:
	python $(poketools)/gbz80disasm.py 0:3224 > rawcode.asm

rle:
	$(foreach f,$(rle_files),python tools/decompressLevelData.py $(f) data/ -d;)


#pngs:
#	find . -iname "*.lz"      -exec $(gfx) unlz {} +
#	find . -iname "*.[12]bpp" -exec $(gfx) png  {} +
#	find . -iname "*.[12]bpp" -exec touch {} \;
#	find . -iname "*.lz"      -exec touch {} \;

#%.2bpp: %.png ; $(gfx) 2bpp $<
#%.1bpp: %.png ; $(gfx) 1bpp $<
#%.lz:   %     ; $(gfx) lz $<


#%.pal: %.2bpp ;
#gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
#%.bin: ;
#%.blk: ;
#%.tilemap: ;

