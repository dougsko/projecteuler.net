/*
 * projecteuler.net
 *
 * problem 70
 *
 * Euler's Totient function, phi(n) [sometimes called the phi function],
 * is used to determine the number of positive numbers less than or
 * equal to n which are relatively prime to n. For example, as 1, 2, 4,
 * 5, 7, and 8, are all less than nine and relatively prime to nine,
 * phi(9)=6.
 * The number 1 is considered to be relatively prime to every positive
 * number, so phi(1)=1.
 *
 * Interestingly, phi(87109)=79180, and it can be seen that 87109 is a
 * permutation of 79180.
 *
 * Find the value of n, 1 <= n <= 10^7, for which phi(n) is a permutation of n
 * and the ratio n/phi(n) produces a minimum.
 *
 */

#include "../tools/helpers.h"

gint
compare(gconstpointer a, gconstpointer b)
{
    if(a < b)
    {
        return -1;
    }
    if(a == b)
    {
        return 0;
    }
    if(a > b)
    {
        return 1;
    }

    return 0;
}

gint
is_permutation(a, b)
{
    GArray *array_a, *array_b;
    gint i = 0;

    array_a = g_array_new(FALSE, FALSE, sizeof (gint));
    array_b = g_array_new(FALSE, FALSE, sizeof (gint));

    i = a % 10;
    g_array_prepend_val(array_a, i);
    i = b % 10;
    g_array_prepend_val(array_b, i);
    while(a > 0)
    {
        i = a % 10;
        g_array_prepend_val(array_a, i);
        a /= 10;
    }
    i = 0;
    while(b > 0)
    {
        i = b % 10;
        g_array_prepend_val(array_b, i);
        b /= 10;
    }
    g_array_remove_index_fast(array_a, array_a->len-1);
    g_array_remove_index_fast(array_b, array_b->len-1);

    g_array_sort(array_a, compare);
    g_array_sort(array_b, compare);

    print_array(array_a);
    print_array(array_b);

    return 0;
}

gint
main()
{
    is_permutation(23145, 23233);

    return 0;
}

