
CC=g++
CFLAGS=-lm -lz -O3 -Wall

all: ngsSim

ngsSim: ngsSim.cpp rbeta.cpp
	$(CC) ngsSim.cpp -o ngsSim $(CFLAGS)

test:
	@cd examples/; bash test.sh 2> test.log; cd ../

clean:
	@rm -rf ngsSim *.o examples/testA* examples/testF.*
