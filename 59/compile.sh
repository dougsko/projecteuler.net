#!/bin/sh

gcc -g `pkg-config --cflags --libs glib-2.0` -lm -I../tools/ test.c -o test
