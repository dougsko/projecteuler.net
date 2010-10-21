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
    gdouble num, digits;
    gint i = 10;
    gdouble j = 1;
    gint count = 0;
    gdouble p = 0;

    while(i > 0)
    {
        digits = digit_count(i);
        for(j=2; pow(j, digits) <= i; j++)
        {
            if(pow(j, digits) == i)
            {
                g_print("%0.f^%0.f = %d\n", j, digits, i);
                count++;
            }
        }
        if(i % 1000 == 0)
        {
            g_print("count = %d\n", count);
        }
        i++;
    }
    g_print("final count = %d\n", count);

    return 0;
}
