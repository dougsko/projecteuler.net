/* Helper functions for projecteuler.net problems. */
#include <stdio.h>
#include <glib.h>
#include <math.h>
#include <gmp.h>
#include <omp.h>

gint gcd(gint a, gint b);

gfloat phi(gint n);

gint is_prime(glong value);

gchar * factorial(gulong n);

gint print_array(GArray *array);

gint sum_array(GArray *array);

gchar * read_file(gchar *filename);

gint int_cmp(gconstpointer a, gconstpointer b);

GArray * array_copy(GArray *old);

gint count_digits(gint n);
