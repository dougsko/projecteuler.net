gcc -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include  -lglib-2.0   -I../tools -lgomp ../tools/helpers.o -lgmp -lm solution.c -o solution
