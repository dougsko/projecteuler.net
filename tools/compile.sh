#!/bin/sh

#gcc -g `pkg-config --cflags --libs glib-2.0` -lm -I../tools/ solution.c -o solution
gcc -g `pkg-config --cflags --libs glib-2.0` -fopenmp -lm -lgmp -I. helpers.o test.c -o test
