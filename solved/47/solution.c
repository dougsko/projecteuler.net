/* projecteuler.net
 *
 * problem 47
 *
 * The first two consecutive numbers to have two distinct prime factors
 * are:
 *
 * 14 = 2 * 7
 * 15 = 3 * 5
 *
 * The first three consecutive numbers to have three distinct prime
 * factors are:
 *
 * 644 = 2^2 *  7 * 23
 * 645 = 3 * 5 * 43
 * 646 = 2 * 17 * 19.
 *
 * Find the first four consecutive integers to have four distinct primes
 * factors. What is the first of these numbers?
 *
 */

#include <stdio.h>
#include <math.h>
#include "helpers.h"

GArray *
make_uniq(GArray *array)
{
    gint i, num1, num2;

    for(i=0; i < (array->len - 1); i++){
        num1 = g_array_index(array, gint, i);
        num2 = g_array_index(array, gint, i+1);
        if(num1 == num2){
            g_array_remove_index(array, i);
            make_uniq(array);
        }
    }
    return array;
}

GArray *
prime_factorization(long x)
{
    long i;			/* counter */
    long c, foo;			/* remaining product to factor */
    GArray *factors;

    factors = g_array_new (FALSE, FALSE, sizeof (gint));
    c = x;

    while ((c % 2) == 0) {
        foo = 2;
        g_array_append_val(factors, foo);
        c = c / 2;
    }

    i = 3;

    while (i <= (sqrt(c)+1)) {
        if ((c % i) == 0) {
            g_array_append_val(factors, i);
            c = c / i;
        }
        else
            i = i + 2;
    }

    if (c > 1){
        g_array_append_val(factors, c);
    }
    return factors;
}

int 
main(int argc, char **argv)
{
    GArray *factors1, *factors2, *factors3, *factors4;
    GArray *uniq1, *uniq2, *uniq3, *uniq4;
    gint i;
    gint num1, num2, num3, num4;

    for(i=2; i <= 1000000; i++){
        factors1 = make_uniq(prime_factorization(i));
        factors2 = make_uniq(prime_factorization(i+1));
        factors3 = make_uniq(prime_factorization(i+2));
        factors4 = make_uniq(prime_factorization(i+3));

        if(factors1->len == 4 && 
                factors2->len == 4 &&
                factors3->len == 4 &&
                factors4->len == 4){
            num1 = i;
            num2 = i+1;
            num3 = i+2;
            num4 = i+3;
            printf("%d\n", num1);
            return 0;
        }
    }

    g_array_free(factors1, TRUE);
    g_array_free(factors2, TRUE);
    g_array_free(factors3, TRUE);
    g_array_free(factors4, TRUE);

    return 0;
}
