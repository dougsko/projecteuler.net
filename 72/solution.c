#include "../tools/pe.h"

/*
 * projecteuler.net
 *
 * problem 72
 *
 * Consider the fraction, n/d, where n and d are positive integers. If n<d
 * and HCF(n,d)=1, it is called a reduced proper fraction.
 *
 * If we list the set of reduced proper fractions for d <= 8 in ascending
 * order of size, we get:
 *
 * 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8,
 * 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
 *
 * It can be seen that there are 21 elements in this set.
 *
 * How many elements would be contained in the set of reduced proper
 * fractions for d 1,000,000?
 *
*/

gint 
main()
{
    gint max = 1000000;
    gint count = 0;
    gint i, j;

    omp_set_num_threads(4);

    #pragma omp parallel for private(j)
    for(i = 2; i <= max; i++)
    {
        for(j = 1; j <= i; j++)
        {
            if( gcd(i, j) == 1 && j < i)
                #pragma omp atomic
                count++;
        }
    }
    printf("%d\n", count);

    return 0;
}
