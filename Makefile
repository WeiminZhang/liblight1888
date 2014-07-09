CC = gcc # if you want to do cross-compile, please change this environment
SOLIB = liblight1888.so
OBJS = ieee1888_XMLgenerator.o ieee1888_XMLparser.o ieee1888_server.o ieee1888_client.o ieee1888_object_factory.o ieee1888_util.o ieee1888_datapool.o
LIBPTHREAD = -lpthread

.PHONY: all clean install uninstall sample

all: $(SOLIB)

$(SOLIB): $(OBJS)
	$(CC) -shared -g -Wall $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS) $(LIBPTHREAD)

sample: install
	make -C ./sample all

clean: 
	-make -C ./sample clean
	-rm -f $(SOLIB) *.elf *.gdb *.o *~

%.o: %.c
	$(CC) -fPIC -c $(CFLAGS) -o $@ $<


install: $(SOLIB)
	install -d /usr/local/include/light1888
	install -d /usr/local/lib/pkgconfig
	install ./*.h /usr/local/include/light1888/
	install $(SOLIB) /usr/local/lib
	install ./light1888.pc /usr/local/lib/pkgconfig
	ldconfig

uninstall:
	rm -rf /usr/local/include/light1888
	rm /usr/local/lib/$(SOLIB)
