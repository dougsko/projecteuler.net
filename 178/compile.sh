#!/bin/sh

gcc -g `pkg-config --cflags --libs glib-2.0` -lm -lpe -I../tools/ solution.c -o solution
