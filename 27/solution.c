#include "../tools/helpers.h"

gint
main()
{
    gint n, old_n, a, b;
    n, old_n = 0;

    omp_set_num_threads(4);
    #pragma omp parallel for
    for(a = -1000; a <= 1000; a++)
    {
        for(b = -1000; b <= 1000; b++)
        {
            while(is_prime(n*n + a*n + b))
                n++;
            if(n > old_n)
            {
                old_n = n;
                g_print("n: %d a: %d b: %d a*b: %d\n", n, a, b, a*b);
            }
            n = 0;
        }
    }
    return 0;
}

