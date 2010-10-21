/* Helper functions for projecteuler.net problems. */

#include <stdio.h>
#include <string.h>
#include <glib.h>
#include <math.h>

gint
gcd(gint a, gint b)
{
    while(a != b) 
    {
        if(a > b){ a = a - b;} 
        else{ b = b - a; }
    }
    return a;
}

gfloat
phi(gint n)
{
    gfloat result = n; 
    gint i;
    
    for(i=2; i * i <= n; i++) 
    {
        if (n % i == 0) 
        {
            result -= result / i;
        } 
        while (n % i == 0)
        {
            n /= i;
        } 
    }
    if (n > 1)
    { 
        result -= result / n;
    }
    return result; 
}

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

gdouble fact(gint n){
    gdouble accu = 1;
    gint i;
    for(i = 1; i <= n; i++){
        accu *= i;
    }
    return accu;
}

gint
print_array(GArray *array)
{
    int i;
    printf("[");
    for(i=0; i < array->len - 1; i++){
        printf("%d, ", g_array_index(array, gint, i));
    }
    printf("%d]\n", g_array_index(array, gint, array->len));
    printf("]\n");
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

gchar *
read_file(gchar *filename)
{
    gchar *contents;
    GError *error = NULL;

    if(! g_file_get_contents(filename, &contents, NULL, &error))
    {
        fprintf(stderr, "%s\n", error->message);
        g_error_free(error);
    }
    return contents;
}


