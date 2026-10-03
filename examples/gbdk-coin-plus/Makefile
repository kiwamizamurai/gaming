GBDK_HOME ?= $(HOME)/gbdk

coin_plus.gb: main.c tiles.c
	GBDK_HOME=$(GBDK_HOME)/ $(GBDK_HOME)/bin/lcc -Wm-yt0x1B -Wm-ya1 -o $@ main.c tiles.c

tiles.c: tiles.png
	$(GBDK_HOME)/bin/png2asset tiles.png -spr8x8 -tiles_only -o tiles.c

clean:
	rm -f coin_plus.gb *.o *.lst *.map *.sym *.asm *.ihx *.noi
