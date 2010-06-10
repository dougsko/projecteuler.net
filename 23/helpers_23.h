#include <glib.h>
#include <math.h>

/* Takes a number and an empty array, then returns it filled with the 
 * proper divisors of NUM.
 */
GArray* 
factors(gint num, GArray *facts);

/* Returns the sum of the elements of a given array */
gint 
sum_array(GArray *array);

/* Given a number and an array containing its proper divisors,
 * returns 1 if NUM is abundant and 0 if not.
 */
gint 
is_abundant(gint num, GArray *facts);

/* Prints the contents of ARRAY's cells */
void 
print_array(GArray *array);

/* Check to see if NUM is the sum of two abundant numbers.
 * Returns 1 if yes, 0 if no.
 */
gint 
is_sum_of_abundants(gint num, GArray *abundants);

/* Finds all the abundant numbers from 0 to 28123 and
 * returns them in an array
 */
GArray*
get_abundants();
