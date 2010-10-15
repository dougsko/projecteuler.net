/* There are exactly ten ways of selecting three from five, 12345:
 *
 * 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
 *
 * In combinatorics, we use the notation, 5C3 = 10.
 *
 * In general,
 *
 * nCr =    
 * n!
 * ,where r <= n, n! = n*(n1)...3*2*1, and 0! = 1.
 * It is not until n = 23, that a value exceeds one-million: 23C10 =
 * 1144066.
 *
 * How many, not necessarily distinct, values of  nCr, for 1  n  100,
 * are greater than one-million?
 *
 */

#include <stdio.h>
#include "../tools/helpers.h"


gint
combo(gint n)
{
    gint i, r;
    gdouble factorial_n, factorial_r, factorial_diff;
    gdouble c;

    for(r=0; r <= n; r++){
        factorial_n = fact(n);
        factorial_diff = fact(n-r);
        factorial_r = fact(r);
        c = factorial_n / (factorial_r * factorial_diff);
        if(c > 1000000){
            printf("c = %0.f, n = %d, r = %d\n", c, n, r);
        }
    }
    return 0;
}

// pipe into 'wc -l'
gint main()
{
    gint i;

    for(i=1; i <= 100; i++){
        combo(i);
    }
    return 0;
} 
        










