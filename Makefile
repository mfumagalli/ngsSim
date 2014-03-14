
CC=g++
CFLAGS=-lm -lz -O3 -Wall

all: ngsSim

ngsSim: ngsSim.cpp rbeta.cpp
	$(CC) ngsSim.cpp -o ngsSim $(CFLAGS)

test:
	@cd examples/; sh ./test.sh 2> /dev/null; cd ../

clean:
	@rm -rf ngsSim *.o examples/testA* examples/testF.*
