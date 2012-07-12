#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "../tools/pe.h"

int
step(char *n)
{
    char *s = n;
    char *p = n;
    char c, d;

    while (*s != '\0'){
        s = p + 1;
        c = *p;
        d = *s;
        //printf("%c - %c = %d\n",c, d, abs(c-d));
        if(abs(c-d) != 1)
        {
            return 0;
        }
        p++;
        s++;
    }
    return 1;
}

int
is_pandigital(char *n)
{
    int i;
    const char *foo = n;
    char *test = "0123456789";
    char *s;
    char c;

    while(*test != '\0')
    {
        c = *test;
        s = c;
        if(strstr(foo, &s) == NULL)
            return 0;
        test++;
    }

    return 1;
}

int
main(int argc, char **argv)
{
    char *s = argv[1];

    if(is_pandigital(s))
        printf("%s is pandigital\n", s);
    else
        printf("%s is not pandigital\n", s);

    if(step(s))
        printf("%s is a step number\n", s);
    else
        printf("%s is not a step number\n", s);

    return 0;
}
