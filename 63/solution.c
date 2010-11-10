#include "../tools/helpers.h"
#include <stdlib.h>

gdouble
digit_count(num)
{
    gdouble digits = 0;

    while(num > 0)
    {
        num /= 10;
        digits++;
    }
    return digits;
}

gint
main()
{
    gdouble digits;
    gint i = 1;
    gdouble j = 1;
    gint count = 0;
    gdouble p;

    while(TRUE)
    {
        digits = digit_count(i);
        for(j=1; pow(j, digits) <= i; j++)
        {
            if(pow(j, digits) == i)
            {
                count++;
                g_print("%0.f^%0.f = %d\tcount = %d\n", j, digits, i, count);
            }
        }
        i++;
    }
    return 0;
}
