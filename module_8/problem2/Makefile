all: test

MYLIBS = libConversions.o
CC = gcc

test: test.o $(MYLIBS)
	$(CC) $@.o $(MYLIBS) -g -o $@

.s.o: 
	$(CC) $(@:.o=.s) -g -c -o $@

