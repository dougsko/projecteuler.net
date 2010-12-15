#include "../tools/helpers.h"

gint
run_it(gint n, gint a, gint b)
{
    gint res;
    res = n * n + a * n + b;
    return res;
}

gint
main()
{
    gint n, old_n, a, b = 0;

    for(a = -1000; a <= 1000; a++)
    {
        for(b = -1000; b <= 1000; b++)
        {
            while(is_prime(run_it(n, a, b)))
                n++;
            if(n > old_n)
            {
                old_n = n;
                g_print("n: %d a: %d b: %d a*b: %d\n", n, a, b, a*b);
            }
            n = 0;
        }
    }
}

