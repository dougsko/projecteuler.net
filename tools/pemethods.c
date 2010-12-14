// Include the Ruby headers and goodies
#include "ruby.h"
#include "helpers.h"

// Defining a space for information and references about the module to be 
// stored internally
VALUE PEMethods = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_pemethods();

// Prototype for our method 'test1' - methods are prefixed by 'method_'
// here
VALUE method_phi(VALUE self, VALUE n);
VALUE method_is_prime(VALUE self, VALUE value);
VALUE method_gcd(VALUE self, VALUE x, VALUE y);
VALUE method_factorial(VALUE self, VALUE x);
VALUE method_count_digits(VALUE self, VALUE n);

// The initialization method for this module
void 
Init_pemethods() 
{
	PEMethods = rb_define_module("PEMethods");
	rb_define_method(PEMethods, "phi", method_phi, 1);
    rb_define_method(PEMethods, "is_prime", method_is_prime, 1);
    rb_define_method(PEMethods, "gcd", method_gcd, 2);
    rb_define_method(PEMethods, "factorial", method_factorial, 1);
    rb_define_method(PEMethods, "count_digits", method_count_digits, 1);
}

VALUE 
method_phi(VALUE self, VALUE n) 
{
    return INT2NUM(phi(FIX2INT(n)));
}

VALUE
method_is_prime(VALUE self, VALUE r_value)
{
    glong value;

    value = NUM2LONG(r_value);
    if (is_prime(value))
        return Qtrue;
    return Qfalse;
}

VALUE
method_gcd(VALUE self, VALUE x, VALUE y)
{
    gint a, b;

    a = NUM2INT(x);
    b = NUM2INT(y);

    return INT2NUM(gcd(a,b));
}

VALUE
method_factorial(VALUE self, VALUE n)
{
    return rb_str_new2(factorial(NUM2ULONG(n)));
}

VALUE
method_count_digits(VALUE self, VALUE n)
{
    return INT2NUM(count_digits(NUM2LONG(n)));
}
