#include <gmp.h>
#include <stdio.h>

int
main()
{
    mpz_t a;
    mpz_t b;
    mpz_t pow_result;
    mpz_t mult_result;
    mpz_t final;

    mpz_init(a);
    mpz_init(b);
    mpz_init(pow_result);
    mpz_init(mult_result);
    mpz_init(final);

    mpz_set_str(a, "2", 10);
    mpz_set_str(b, "28433", 10);

    mpz_pow_ui(pow_result, a, 7830457);
    mpz_mul(mult_result, pow_result, b);
    mpz_add_ui(final, mult_result, 1);

    gmp_printf("%Zd\n", final);

    return 0;
}
