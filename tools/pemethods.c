// Include the Ruby headers and goodies
#include "ruby.h"
#include <glib.h>

// Defining a space for information and references about the module to be 
// stored internally
VALUE PEMethods = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_pemethods();

// Prototype for our method 'test1' - methods are prefixed by 'method_'
// here
VALUE method_phi(VALUE self, VALUE n);
VALUE method_is_prime(VALUE self, VALUE value);

// The initialization method for this module
void 
Init_pemethods() 
{
	PEMethods = rb_define_module("PEMethods");
	rb_define_method(PEMethods, "phi", method_phi, 1);
    rb_define_method(PEMethods, "is_prime", method_is_prime, 1);
}

// Our 'test1' method.. it simply returns a value of '10' for now.
VALUE 
method_phi(VALUE self, VALUE n) 
{
	gint x, result, i;
    
    x = FIX2INT(n);
    result = x;

    for(i=2; i * i <= x; i++)
    {
        if (x % i == 0)
        {
            result -= result / i;
        }
        while (x % i == 0)
        {
            x /= i;
        }
    }
    if (x > 1)
    {
        result -= result / x;
    }
    return INT2NUM(result);
}

VALUE
method_is_prime(VALUE self, VALUE value)
{
    gint j, r, rold, rnew;
    r = 0;
    rnew = 1;
    do {
        rold = r;
        r = rnew;
        rnew = ( r + ( NUM2LONG(value) / r ) );
        rnew >>= 1;
    } while( rold != rnew );
    for (j = 2; ( j <= rnew ); ++j){
        if ( value % j == 0 )
            return Qfalse;
    }
    return Qtrue;
}
