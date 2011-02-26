#include "../tools/pe.h"

// a10 == 614656

gint
main()
{
    //gint i = 11;
    mpz_t i, power, sum;
    gint count = 0;
    gint j;
    GPtrArray *special;
    gchar *foo, *bar, *baz;

    mpz_init_set_ui(i, 11);
    mpz_init(power);
    mpz_init(sum);

    special = g_ptr_array_new();

    while(special->len < 30)
    {

        baz = mpz_get_str(NULL, 10, i);
        foo = add_digits_str(baz);
        mpz_set_str(sum, foo, 10);
        free(foo);
        free(baz);
        for(j = 1; j <= 100; j++)
        {
            mpz_pow_ui(power, sum, j);
            if(mpz_cmp(power, i) > 0)
                break;
            if(mpz_cmp(power, i) == 0)
            {
                bar = mpz_get_str(NULL, 10, i);
                g_ptr_array_add(special, bar);
                g_print("%d: %s\t%d\n", special->len, bar, j);
                free(bar);
            }
        }
        mpz_add_ui(i, i, 1);
    }
    mpz_clear(i);
    printf("%s\n", g_ptr_array_index(special, special->len-1));
    g_ptr_array_free(special, TRUE);
    return 0;
}
