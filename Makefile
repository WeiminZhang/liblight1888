SOLIBS = liblight1888.so
OBJS = ieee1888_XMLgenerator.o ieee1888_XMLparser.o ieee1888_server.o ieee1888_client.o ieee1888_object_factory.o ieee1888_util.o
LIBPTHREAD = -lpthread

# OBJS = IEEE1888UploadAgent.o GEmuNet.o GEmuNet-to-1888.o

all: $(SOLIBS)

$(SOLIBS): $(OBJS)
	$(CC) -shared -g -Wall $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS) $(LIBPTHREAD)

clean: 
	-rm -f $(SOLIBS) *.elf *.gdb *.o *~

%.o: %.c
	$(CC) -fPIC -c $(CFLAGS) -o $@ $<
