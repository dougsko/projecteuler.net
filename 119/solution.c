#include "../tools/pe.h"


gint 
add_digits(gint num)
{
    gchar *p;
    gint sum = 0;

    p = itoa(num, 10);
    while(*p != '\0')
    {
        gchar c = *p;
        p++;
        sum += atoi(&c);
    }
    return sum;
}

gint
main()
{
    gint start = 11;
    gint count = 0;
    gint sum, power, last, j;
    while(count <= 10)
    {
        sum = add_digits(start);
        for(j = 1; j <= 100; j++)
        {
            power = pow(start, j);
            if(power > start)
                break;
            if(power == start)
                last = start;
        }
    }
    printf("%d\n", last);
    return 0;
}
