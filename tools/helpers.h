/* Helper functions for projecteuler.net problems. */

#include <string.h>
#include <glib.h>

int is_prime(long value){
    long j, r, rold, rnew;
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
                return 0;
        }
            return 1;
}

double fact(int n){
    double accu = 1;
    int i;
    for(i = 1; i <= n; i++){
        accu *= i;
    }
    return accu;
}

gint
print_array(GArray *array)
{
    int i;
    for(i=0; i < array->len; i++){
        printf("%d\n", g_array_index(array, gint, i));
    }
    return 0;
}

gint
sum_array(GArray *array)
{
    gint i;
    gint sum = 0;

    for(i=0; i < array->len; i++){
        sum = sum + g_array_index(array, gint, i);
    }
    return sum;
}
