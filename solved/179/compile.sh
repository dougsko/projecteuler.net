#!/bin/sh

gcc -g -Wall -fPIC -fopenmp -o solution solution.c -lm -lgmp -lgomp
