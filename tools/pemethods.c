// Include the Ruby headers and goodies
#include "ruby.h"
#include <glib.h>
#include <math.h>
#include <omp.h>
#include <gmp.h>

// Defining a space for information and references about the module to be 
// stored internally
VALUE PEMethods = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_pemethods();

// Prototype for our method 'test1' - methods are prefixed by 'method_'
// here
VALUE method_parallel_phi(VALUE self, VALUE n);
VALUE method_phi(VALUE self, VALUE n);
VALUE method_parallel_is_prime(VALUE self, VALUE value);
VALUE method_is_prime(VALUE self, VALUE value);
VALUE method_gcd(VALUE self, VALUE x, VALUE y);
VALUE method_fact(VALUE self, VALUE x);
VALUE method_count_digits(VALUE self, VALUE n);

// The initialization method for this module
void 
Init_pemethods() 
{
	PEMethods = rb_define_module("PEMethods");
    rb_define_method(PEMethods, "parallel_phi", method_parallel_phi, 1);
	rb_define_method(PEMethods, "phi", method_phi, 1);
    rb_define_method(PEMethods, "parallel_is_prime", method_parallel_is_prime, 1);
    rb_define_method(PEMethods, "is_prime", method_is_prime, 1);
    rb_define_method(PEMethods, "gcd", method_gcd, 2);
    rb_define_method(PEMethods, "fact", method_fact, 1);
    rb_define_method(PEMethods, "count_digits", method_count_digits, 1);
}

VALUE
method_parallel_phi(VALUE self, VALUE n)
{
    gint x, result, i;
    x = FIX2INT(n);
    result = x;

    #pragma omp parallel
    {
        #pragma omp parallel for shared(i, x, result)
        for(i=2; i * i <= x; i++)
        {
            if (x % i == 0)
                result -= result / i;
            while (x % i == 0)
                x /= i;
        }
        if (x > 1)
            result -= result / x;
        }
    return INT2NUM(result);
}

VALUE 
method_phi(VALUE self, VALUE n) 
{
	gint x, result, i;
    
    x = FIX2INT(n);
    result = x;

    for(i=2; i * i <= x; i++)
    {
        if (x % i == 0)
            result -= result / i;
        while (x % i == 0)
            x /= i;
    }
    if (x > 1)
        result -= result / x;
    return INT2NUM(result);
}

VALUE
method_parallel_is_prime(VALUE self, VALUE r_value)
{
    gint j, r, rold, rnew;
    glong value;

    value = NUM2LONG(r_value);
    r = 0;
    rnew = 1;
    do {
        rold = r;
        r = rnew;
        rnew = ( r + ( value / r ) );
        rnew >>= 1;
    } while( rold != rnew );
    #pragma omp parallel for
    for (j = 2; ( j <= rnew ); ++j){
        if ( value % j == 0 )
            return Qfalse;
    }
    return Qtrue;
}

VALUE
method_is_prime(VALUE self, VALUE r_value)
{
    gint j, r, rold, rnew;
    glong value;

    value = NUM2LONG(r_value);
    r = 0;
    rnew = 1;
    do {
        rold = r;
        r = rnew;
        rnew = ( r + ( value / r ) );
        rnew >>= 1;
    } while( rold != rnew );
    for (j = 2; ( j <= rnew ); ++j){
        if ( value % j == 0 )
            return Qfalse;
    }
    return Qtrue;
}

VALUE
method_gcd(VALUE self, VALUE x, VALUE y)
{
    gint a, b;

    a = NUM2INT(x);
    b = NUM2INT(y);

    while(a != b)
    {
        if(a > b){ a = a - b;}
        else{ b = b - a; }
    }
    return INT2NUM(a);
}

VALUE
method_fact(VALUE self, VALUE x)
{
    mpz_t n;
    mpz_t fact;

    mpz_init_set_ui(n, NUM2ULONG(x));
    mpz_init(fact);

    mpz_fac_ui(fact, NUM2ULONG(x));

    return rb_str_new2(mpz_get_str(NULL, 10, fact));
}


VALUE
method_count_digits(VALUE self, VALUE n)
{
    return INT2NUM((int)log10(NUM2LONG(n)) + 1);
}
