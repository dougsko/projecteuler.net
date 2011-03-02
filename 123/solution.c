#include "../tools/pe.h"
/*
 * projecteuler.net
 *
 * problem 123
 *
 * Let p_n be the nth prime: 2, 3, 5, 7, 11, ..., and let r be the
 * remainder when (p_n-1)^n + (p_n+1)^n is divided by p_n^2.
 *
 * For example, when n = 3, p_3 = 5, and 43 + 63 = 280 = 5 mod 25.
 *
 * The least value of n for which the remainder first exceeds 109 is
 * 7037.
 *
 * Find the least value of n for which the remainder first exceeds 1010.
 *
*/


gint
do_work(gchar *p_n, gint n)
{
    mpz_t pn, pn_plus_one, pn_minus_one, first, second, sum, pn_squared, final;
    gint res;

    mpz_init_set_str(pn, p_n, 10);
    mpz_init(pn_plus_one);
    mpz_init(pn_minus_one);
    mpz_init(first);
    mpz_init(second);
    mpz_init(sum);
    mpz_init(pn_squared);
    mpz_init(final);

    mpz_add_ui(pn_plus_one, pn, 1);
    mpz_sub_ui(pn_minus_one, pn, 1);

    mpz_pow_ui(first, pn_plus_one, n);
    mpz_pow_ui(second, pn_minus_one, n);

    mpz_add(sum, first, second);
    /*
    printf("%s^%d + %s^%d = %s + %s = %s\n", 
            mpz_get_str(NULL, 10, pn_plus_one),
            n,
            mpz_get_str(NULL, 10, pn_minus_one),
            n,
            mpz_get_str(NULL, 10, first),
            mpz_get_str(NULL, 10, second),
            mpz_get_str(NULL, 10, sum));
     */

    mpz_pow_ui(pn_squared, pn, 2);

    mpz_mod(final, sum, pn_squared);

    mpz_clear(pn_plus_one);
    mpz_clear(pn_minus_one);
    mpz_clear(first);
    mpz_clear(second);
    mpz_clear(sum);
    mpz_clear(pn_squared);

    //printf("%s\n", mpz_get_str(NULL, 10, final));
    res = strlen(mpz_get_str(NULL, 10, final));
    mpz_clear(final);

    return res;
}



gchar * 
p(gint n)
{
    gint count = 0;
    gchar *prime = "0";

    while(count < n)
    {
        prime = next_prime(prime);
        count++;
    }
    return prime;
}

gint
main()
{

    gint n = 7000;
    gint res = 0;

    while(res != 11)
    {
        res = do_work(p(n), n);
        n++;
    }
    n--;
    printf("%d", n);

    return 0;
}
