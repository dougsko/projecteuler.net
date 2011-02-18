#include "../tools/pe.h"

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
