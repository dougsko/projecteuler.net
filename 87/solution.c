#include "../tools/pe.h"

/* The smallest number expressible as the sum of a prime square, prime
 * cube, and prime fourth power is 28. In fact, there are exactly four
 * numbers below fifty that can be expressed in such a way:
 *
 * 28 = 2^2 + 2^3 + 2^4
 * 33 = 3^2 + 2^3 + 2^4
 * 49 = 5^2 + 2^3 + 2^4
 * 47 = 2^2 + 3^3 + 2^4
 * How many numbers below fifty million can be expressed as the sum of a
 * prime square, prime cube, and prime fourth power?
 */

int
main()
{
    gdouble MAX = 100000;
    gulong out;
    gint i, j, k;
    gint count = 0;

    omp_set_num_threads(4);
    
    #pragma omp parallel for private(j, k)
    for(i = 2; i <= 1000; i++)
    {
        for(j = 2; j <= 1000; j++)
        {
            for(k = 2; k <= 1000; k++)
            {
                if(is_prime(i) && is_prime(j) && is_prime(k))
                {
                    out = i*i + j*j*j + k*k*k*k;
                    if(out < 1000)
                    {
                        //printf("%lu = %d^2 + %d^3 + %d^4\n", out, i, j, k);
                        count++;
                    }
                }
            }
        }
    }
    printf("count = %d\n", count);

    return 0;
}
