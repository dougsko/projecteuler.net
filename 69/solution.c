/*
 * projecteuler.net
 *
 * problem 69
 *
 *
 */

#include "../tools/helpers.h"

gint
main()
{
    gfloat biggest, res = 0.0;
    gint max, n = 0;
    gint ceiling = 1000000;

    for(n=2; n <= ceiling; n++)
    {
        //g_print("phi(%d) = %0.f\tn/phi(n) = %f\n", n, phi(n), n/phi(n));
        res = n / phi(n);
        if(res > biggest)
        {
            max = n;
            biggest = res;
        }
    }
    
    g_print("n = %d\n", max);

    return 0;
}
