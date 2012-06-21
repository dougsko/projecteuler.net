#!/bin/sh

#gcc -g `pkg-config --cflags --libs glib-2.0` -lm -I../tools/ solution.c -o solution

# freebsd
#gcc -o maxbit maxbit.c `pkg-config --cflags --libs glib-2.0` -I/usr/home/doug/build/pgapack-1.1/include  -DWL=32  -L/usr/home/doug/build/pgapack-1.1/lib/freebsd  -lpgaO  -lm

# linux 
#gcc -I/usr/include/pgapack-serial  -DWL=32 -lpgapack-serial1  -lm maxbit.c -o maxbit

#gcc -o ga_solution ga_solution.c `pkg-config --cflags --libs glib-2.0` -I../tools  -I/usr/local/include -Wall -g -O2  -L/usr/local/lib/ -lgaul -lgaul_util -lm -lpthread -lpthread

gcc -o ga_solution ga_solution.c `pkg-config --cflags --libs glib-2.0` \
    -I../tools  -I/usr/local/include -Wall -g -O2  -L/usr/local/lib/ \
    -lgaul -lgaul_util -lm -lpthread -L../tools -lpe
