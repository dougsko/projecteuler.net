#include "pe.h"
#include <omp.h>
#include <stdio.h>

int
main()
{
    mpz_t count, base, max, j;
    gint i;
    gchar *num_str;

    mpz_init(count);
    mpz_init(max);
    mpz_init(base);
    mpz_init(j);

    mpz_set_ui(count, 0);
    mpz_set_ui(base, 10);
    mpz_pow_ui(max, base, 40);

    while(mpz_cmp(j, max) < 0)
    {
        num_str = mpz_get_str(NULL, 10, j);
        if(is_step(num_str) && is_pandigital(num_str))
        {
            mpz_add_ui(count, count, 1);
        }
        mpz_add_ui(j, j, 1);
        free(num_str);
    }
    mpz_sub_ui(count, count, 1);
    g_print("count = %s\n", mpz_get_str(NULL, 10, count));

    return 0;
}







