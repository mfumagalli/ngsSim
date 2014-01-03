
CC=g++
CFLAGS=-lm -lz -O3 -Wall

all: ngsSim

ngsSim: ngsSim.cpp rbeta.cpp
	$(CC) ngsSim.cpp -o ngsSim $(CFLAGS)

clean:
	rm -rf *o ngsSim
