#include "pe.h"

int
main()
{
    mpz_t base, upper, start, j, count;
    gint i;
    gchar *num_str;

    mpz_init(base);
    mpz_init(upper);
    mpz_init(j);
    mpz_init(count);

    mpz_set_ui(count, 0);
    mpz_set_ui(base, 10);
    mpz_pow_ui(upper, base, 10);

    while(mpz_cmp(j, upper) < 0)
    {
        num_str = mpz_get_str(NULL, 10, j);
    
        if(! is_bouncy(num_str))
            mpz_add_ui(count, count, 1);
        
        mpz_add_ui(j, j, 1);
        free(num_str);
    }
    mpz_sub_ui(count, count, 1);
    g_print("count = %s\n", mpz_get_str(NULL, 10, count));

    return 0;
}






