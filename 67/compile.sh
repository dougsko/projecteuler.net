#!/bin/sh

#gcc -g `pkg-config --cflags --libs glib-2.0` -lm -I../tools/ solution.c -o solution

gcc `pkg-config --cflags glib-2.0` -I../tools -I/usr/local/include -Wall -g  -c -o ga_solution.o ga_solution.c && \

gcc `pkg-config --cflags --libs glib-2.0` -I../tools  -I/usr/local/include -Wall -g -O2  -L/usr/local/lib/ -o ga_solution ga_solution.o -lgaul -lgaul_util -lm -lpthread -lpthread && \

rm ga_solution.o