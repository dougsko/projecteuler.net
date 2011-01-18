#include "../tools/pe.h"



int
main()
{
    gchar *numbers;
    gchar **number_pairs, **pair;
    gint i, line_num;
    mpz_t rop, base, exp, mod, biggest;
    gdouble gbase, gexp;

    mpz_init(rop);
    mpz_init(base);
    mpz_init(exp);
    mpz_init(mod);
    mpz_init(biggest);

    numbers = read_file("base_exp.txt");
    number_pairs = g_strsplit(numbers, "\n", -1);
    
    mpz_set_ui(mod, 0);

    omp_set_num_threads(4);

    #pragma omp parallel for
    for(i = 0; i < 1000; i++)
    {
        pair = g_strsplit(number_pairs[i], ",", -1);
        
        mpz_set_str(base, pair[0], 10);
        mpz_set_str(exp, pair[1], 10);

        gbase = g_ascii_strtod(pair[0], NULL);
        gexp = g_ascii_strtod(pair[1], NULL);
        mpz_ui_pow_ui(rop, gbase, gexp);
        //mpz_powm(rop, base, exp, mod);

        if(mpz_cmp(rop, biggest) > 0)
        {
            mpz_set(biggest, rop);
            line_num = i;
        }

    }
    g_print("%d: %s\n", line_num, number_pairs[line_num]);

    return 0;
}
