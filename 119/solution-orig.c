#include "../tools/pe.h"

// a10 == 614656

gint
main()
{
    gint i = 11;
    gint count = 0;
    gint sum, power, last, j;
    GArray *special;

    special = g_array_new(FALSE, FALSE, sizeof(gint));

    while(special->len < 20)
    {
        sum = add_digits(i);
        for(j = 1; j <= 50; j++)
        {
            power = pow(sum, j);
            if(power > i)
                break;
            if(power == i)
            {
                g_array_append_val(special, i);
            }
        }
        i++;
    }
    printf("%d\n", g_array_index(special, gint, special->len-1));
    return 0;
}