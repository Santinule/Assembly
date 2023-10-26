all: miles2km kph
LIB= libConversions.o
CC=gcc

miles2km: miles2km.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

kph: kph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
