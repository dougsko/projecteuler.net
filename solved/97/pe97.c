// Include the Ruby headers and goodies
#include "ruby.h"
#include <gmp.h>

// Defining a space for information and references about the module to be 
// stored internally
VALUE PE97 = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_pe97();

// Prototype for our method 'test1' - methods are prefixed by 'method_'
// here
VALUE method_get_prime(VALUE self);

// The initialization method for this module
void 
Init_pe97() 
{
	PE97 = rb_define_module("PE97");
    rb_define_method(PE97, "get_prime", method_get_prime, 0);
}

VALUE
method_get_prime(VALUE self)
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

    return rb_str_new2(mpz_get_str(NULL, 10, final));
}
