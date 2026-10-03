GBDK_HOME ?= $(HOME)/gbdk

coin.gb: main.c
	GBDK_HOME=$(GBDK_HOME)/ $(GBDK_HOME)/bin/lcc -o $@ main.c

clean:
	rm -f coin.gb *.o *.lst *.map *.sym *.asm *.ihx *.noi
