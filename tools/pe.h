/* Helper functions for projecteuler.net problems. */
#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <glib.h>
#include <math.h>
#include <string.h>
#include <gmp.h>
#include <omp.h>

gint gcd(gint a, gint b);
gfloat phi(gint n);
gboolean is_prime(glong value);
gchar * factorial(gulong n);
gint print_array(GArray *array);
gint sum_array(GArray *array);
gchar * read_file(gchar *filename);
gint int_cmp(gconstpointer a, gconstpointer b);
GArray * array_copy(GArray *old);
gint count_digits(gdouble n);
gboolean is_bouncy(gchar *n);
gchar * next_prime(gchar *n);
gboolean prob_prime(gchar *n);
gchar * sieve(gulong start, gulong end);
gchar * itoa(gint val, gint base);
gint add_digits(gint n);
<<<<<<< HEAD
=======
gchar * add_digits_str(gchar *n);
>>>>>>> dbd0a1bc6541eabb2b14aa5f8909193f7bc0741d
