/* projecteuler.net
 *
 * problem 44
 *
 * Pentagonal numbers are generated by the formula, Pn=n(3n1)/2. The
 * first ten pentagonal numbers are:
 *
 * 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
 *
 * It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their
 * difference, 70  22 = 48, is not pentagonal.
 *
 * Find the pair of pentagonal numbers, Pj and Pk, for which their sum
 * and difference is pentagonal and D = |Pk  Pj| is minimised; what is
 * the value of D?
 */

#include <stdio.h>
#include <glib.h>
#include "helpers.h"

GArray *
make_pentagonal_array(gint size)
{
    GArray *pentagonals;
    gint n, pn;
    
    pentagonals = g_array_new(FALSE, FALSE, sizeof(gint));

    for(n = 1; n <= size; n++){
        pn = n * (3 * n - 1) / 2;
        g_array_append_val(pentagonals, pn);
    }
    return pentagonals;
}

gint
print_array(GArray *array)
{
    int i;
    for(i=0; i < array->len; i++){
        printf("%d\n", g_array_index(array, gint, i));
    }
    return 0;
}

gint
sum_array(GArray *array)
{
    gint i;
    gint sum = 0;

    for(i=0; i < array->len; i++){
        sum = sum + g_array_index(array, gint, i);
    }
    return sum;
}

gint
is_pentagonal(GArray *pents, gint num)
{
    gint i;

    for(i=0; i < pents->len; i++){
        if(g_array_index(pents, gint, i) == num){
            return 1;
        }
    }
    return 0;
}

gint 
main(int argc, char **argv)
{
    GArray *pentagonals;
    gint sum, diff;
    gint i, j, k;

    pentagonals = make_pentagonal_array(atoi(argv[1]));

    for(i=0; i < pentagonals->len; i++){
        for(j=i+1; j < pentagonals->len; j++){
            sum = g_array_index(pentagonals, gint, i) + g_array_index(pentagonals, gint, j);
            diff = g_array_index(pentagonals, gint, j) - g_array_index(pentagonals, gint, i);
            if(is_pentagonal(pentagonals, sum) && is_pentagonal(pentagonals, diff)){
                printf("The sum and difference of %d and %d are both pentagonal\n",
                    g_array_index(pentagonals, gint, i),
                    g_array_index(pentagonals, gint, j));
            }
            printf("Their absolute value is: %d\n", g_array_index(pentagonals, gint, j) - g_array_index(pentagonals, gint, i));
        }
    }
    
                  
    g_array_free(pentagonals, TRUE);
    return 0;
}