#!/bin/sh

#gcc -g `pkg-config --cflags --libs glib-2.0` -fopenmp -lgmp -lm -I../tools/ ../tools/helpers.o solution.c -o solution
#gcc -g `pkg-config --cflags --libs glib-2.0` -fopenmp -lm -lgmp -I. helpers.o test.c -o test

gcc -Wall -fPIC -c -I/usr/local/include `pkg-config --cflags --libs glib-2.0` \
    -fopenmp  -I. helpers.c 
gcc -L/usr/local/lib `pkg-config --cflags --libs glib-2.0` -fopenmp -shared -Wl,-soname,helpers.so \
    -o helpers.so helpers.o -lm -lgmp 
