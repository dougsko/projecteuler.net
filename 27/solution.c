#include "../tools/helpers.h"

gint
main()
{
    gint n, old_n, a, b = 0;

    omp_set_num_threads(4);
    #pragma omp parallel for private(n)
    for(a = -10; a <= 10; a++)
    {
        for(b = -10; b <= 10; b++)
        {
            while(is_prime(n * n + a * n + b))
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

