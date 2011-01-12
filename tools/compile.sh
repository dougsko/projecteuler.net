#!/bin/sh

#gcc -g `pkg-config --cflags --libs glib-2.0` -fopenmp -lgmp -lm -I../tools/ ../tools/helpers.o solution.c -o solution
#gcc -g `pkg-config --cflags --libs glib-2.0` -fopenmp -lm -lgmp -I. helpers.o test.c -o test

gcc -Wall -fPIC -c `pkg-config --cflags --libs glib-2.0` -fopenmp -lm \
    -lgmp -I. helpers.c
gcc -shared -Wl,-soname,libhelpers.so -o libhelpers.so helpers.o
