CC = gcc # if you want to do cross-compile, please change this environment
LDFLAGS = -lpthread $(shell pkg-config --libs light1888)
CFLAGS = $(shell pkg-config --cflags light1888)
EXEUTABLE = ieee1888_sample_gw

.PHONY: all clean

all: $(EXEUTABLE)

$(EXEUTABLE): ieee1888_sample_gw.c
	$(CC) -g -Wall $(LDFLAGS) -o $@ $< $(CFLAGS)

clean: 
	-rm -f $(EXEUTABLE) *.elf *.gdb *.o *~
