CXX ?= g++

CXXFLAGS := -O3 -Wall $(CXXFLAGS)
LDLIBS = -lm -lz

all: ngsSim

ngsSim: ngsSim.cpp rbeta.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $@.cpp $(LDFLAGS) $(LDLIBS) -o $@

test:
	@cd examples/; bash test.sh 2> test.log; cd ../

clean:
	@rm -rf ngsSim *.o examples/testA* examples/testF.*

.PHONY: all clean test
