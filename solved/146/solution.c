/* projecteuler.net
 *
 * problem 146
 *
 */

#include "pe.h"

int
main()
{
    mpz_t upper, n, n_squared, sum, res1, res2, res3, res4, res5, res6, total, next;
    gchar *num_str;

    mpz_init(upper);
    mpz_init(n);
    mpz_init(n_squared);
    mpz_init(sum);
    mpz_init(total);
    mpz_init(res1);
    mpz_init(res2);
    mpz_init(res3);
    mpz_init(res4);
    mpz_init(res5);
    mpz_init(res6);
    mpz_init(next);

    mpz_set_ui(n, 1);
    mpz_set_ui(upper, 150000000);

    while(mpz_cmp(n, upper) < 0)
    {
        mpz_pow_ui(n_squared, n, 2);

        mpz_add_ui(res1, n_squared, 1);
        mpz_add_ui(res2, n_squared, 3);
        mpz_add_ui(res3, n_squared, 7);
        mpz_add_ui(res4, n_squared, 9);
        mpz_add_ui(res5, n_squared, 13);
        mpz_add_ui(res6, n_squared, 27);

        if(mpz_probab_prime_p(res1, 5) != 0)
        {
            mpz_nextprime(next, res1);
            if(mpz_cmp(next, res2) == 0)
            {
                mpz_nextprime(next, res2);
                if(mpz_cmp(next, res3) == 0)
                {
                    mpz_nextprime(next, res3);
                    if(mpz_cmp(next, res4) == 0)
                    {
                        mpz_nextprime(next, res4);
                        if(mpz_cmp(next, res5) == 0)
                        {
                            mpz_nextprime(next, res5);
                            if(mpz_cmp(next, res6) == 0)
                            {
                                mpz_add(total, total, n);
                                //g_print("n = %s\n", mpz_get_str(NULL, 10, n));
                                //g_print("total = %s\n", mpz_get_str(NULL, 10, total));
                            }
                        }
                    }
                }
            }
        }
        mpz_add_ui(n, n, 1);
    }
    g_print("total = %s\n", mpz_get_str(NULL, 10, total));

    return 0;
}






