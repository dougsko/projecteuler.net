CFLAGS= -g `pkg-config --libs --cflags glib-2.0` -lm -I.

all: solution tests

solution: helpers_23.o 

tests: helpers_23.o

clean:
	rm solution tests *.o
