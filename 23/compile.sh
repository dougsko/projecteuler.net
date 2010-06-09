#!/bin/sh

gcc -g `pkg-config --libs --cflags glib-2.0` -lm -o solution solution.c
