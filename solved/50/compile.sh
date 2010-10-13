#!/bin/sh

gcc `pkg-config --cflags --libs glib-2.0` -I../tools/ solution.c -o solution
