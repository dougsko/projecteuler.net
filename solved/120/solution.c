/* projecteuler.net
 *
 * problem 120
 *
 * Let r be the remainder when (a - 1)^n + (a+1)^n is divided by a2.
 *
 * For example, if a = 7 and n = 3, then r = 42: 6^3 + 8^3 = 728 == 42 mod
 * 49. And as n varies, so too will r, but for a = 7 it turns out that
 * rmax = 42.
 *
 * For 3 <= a <= 1000, find  sum(rmax).
 *
 */

#include "../tools/pe.h"

gint
main()
{
    gint a, n;
    mpz_t biggest_r, r, sum, a_minus_one, a_plus_one, op1, op2;
    gchar *foo;

    mpz_init(biggest_r);
    mpz_init(r);
    mpz_init(sum);
    mpz_init(a_minus_one);
    mpz_init(a_plus_one);
    mpz_init(op1);
    mpz_init(op2);

    //omp_set_num_threads(4);

    //#pragma omp parallel for private(n)
    for(a = 3; a <= 1000; a++)
    {
        mpz_set_ui(a_minus_one, a - 1);
        mpz_set_ui(a_plus_one, a + 1);
        for(n = 2; n <= 1500; n++)
        {
            //r = (gint)(pow(a - 1, n) + pow(a + 1, n)) % (gint)pow(a, 2);

            mpz_ui_pow_ui(a_minus_one, a - 1, n);
            mpz_ui_pow_ui(a_plus_one, a + 1, n);

            mpz_add(op1, a_minus_one, a_plus_one);
            mpz_set_ui(op2, a*a);

            mpz_mod(r, op1, op2);

            if(mpz_cmp(r, biggest_r) > 0)
                mpz_set(biggest_r, r);

        }
        mpz_add(sum, biggest_r, sum);
    }
    foo = mpz_get_str(NULL, 10, sum);
    printf("sum of biggest remainders = %s\n", foo);

    mpz_clear(a_minus_one);
    mpz_clear(a_plus_one);
    mpz_clear(sum);
    mpz_clear(r);
    mpz_clear(biggest_r);
    mpz_clear(op1);
    mpz_clear(op2);

    return 0;

}
