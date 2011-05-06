/* projecteuler.net
 *
 * problem 146
 *
 */
#include "pe.h"

int
main()
{
    mpz_t base, upper, start, j, sum, res1, res2, res3, res4, res5, res6;
    gint i;
    gchar *num1, *num2, *num3, *num4, *num5, *num6;

    mpz_init(base);
    mpz_init(upper);
    mpz_init(j);
    mpz_init(sum);
    mpz_init(res);

    mpz_set_ui(count, 0);
    mpz_set_ui(res, 1);
    

    while(mpz_cmp(j, upper) < 0)
    {
        mpz_set_ui(base, j);
        mpz_pow_ui(res1, base, 2);
        mpz_add_ui(res1, 1, res1);
        num1 = mpz_get_str(NULL, 10, res1);

        mpz_pow_ui(res2, base, 2);
        mpz_add_ui(res2, 3, res2);
        num2 = mpz_get_str(NULL, 10, res2);
    
        if(! is_bouncy(num_str))
            mpz_add_ui(count, count, 1);
        
        mpz_add_ui(j, j, 1);
        free(num_str);
    }
    mpz_sub_ui(count, count, 1);
    g_print("count = %s\n", mpz_get_str(NULL, 10, count));

    return 0;
}






