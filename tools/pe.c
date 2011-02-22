/* Helper functions for projecteuler.net problems. */
#include "pe.h"

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
            result -= result / i;
        while (n % i == 0)
            n /= i;
    }
    if (n > 1)
        result -= result / n;
    return result; 
}

gboolean 
is_prime(glong value)
{
    int i;
    if (value <= 1) 
        return FALSE;
    for (i=2; i*i<=value; i++)
    {
        if (value % i == 0) 
            return FALSE;
    }
    return TRUE;
}

gchar * 
factorial(gulong x)
{
    mpz_t n;
    mpz_t fact;

    mpz_init_set_ui(n, x);
    mpz_init(fact);

    mpz_fac_ui(fact, x);

    return mpz_get_str(NULL, 10, fact);
}

gchar *
next_prime(gchar *n)
{
    mpz_t op, rop;
    
    mpz_init(op);
    mpz_init(rop);
    mpz_set_str(op, n, 10);
    mpz_nextprime(rop, op);
    return mpz_get_str(NULL, 10, rop);
}

gboolean
prob_prime(gchar *num)
{
    mpz_t n;

    mpz_init_set_str(n, num, 10);
    //mpz_init_set_ui(n, num);

    if(mpz_probab_prime_p(n, 6))
        return TRUE;
    return FALSE;
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

gint
int_cmp(gconstpointer a, gconstpointer b)
{

    const gint *aa = (const gint *)a;
    const gint *bb = (const gint *)b;

    g_print("%d\t%d\n", *aa, *bb);
    if(*aa > *bb)
        return 1;
    else if(*bb > *aa)
        return -1;
    else
        return 0;
}

GArray *
array_copy(GArray *old)
{
    GArray *new;
    gint i;

    new = g_array_new (FALSE, FALSE, sizeof (gint));
    for(i =0; i < old->len; i++)
    {
        g_array_append_val(new, g_array_index(old, gint, i));
    }
    return new;
}

gint
count_digits(gdouble n)
{
    return (gint)(log10(n) + 1);
}

gboolean
is_bouncy(gchar *str_num)
{
    gint i, first, second;
    guint num_length;
    gboolean increasing, decreasing = FALSE;

    num_length = strlen(str_num);
    for(i = 0; i < num_length - 1; i++)
    {
        first = g_ascii_digit_value(str_num[i]);
        second = g_ascii_digit_value(str_num[i + 1]);

        if(first > second)
        {
            decreasing = TRUE;
            //g_print("%d > %d\n", first, second);
        }
        if(first < second)
        {
            increasing = TRUE;
            //g_print("%d < %d\n", first, second);
        }
        if((increasing == TRUE) && (decreasing == TRUE))
            return TRUE;
    }
    return FALSE;
}

gchar *
sieve(gulong start, gulong end)
{
    gulong i, j = start;
    gulong size = end ;
    gchar *sieve = calloc(size, 1);
    gchar *primes;
    gint count = 0;

    for (i=2; i*i <= size; i++)
    {
        if(! sieve[i])
        {
            for(j = i+i; j < size; j += i)
                sieve[j] = 1;
        }
    }
    for (i=start; i<size; i++)
    {
        if (!sieve[i])
        {
            count++;
            //printf("%d ", i);
        }
    }
    //printf("\n");
    printf("count = %d\n", count);
    free(sieve);
    return NULL;
}

gchar *
itoa(int val, int base)
{
    static char buf[32] = {0};
    int i = 30;

    for(; val && i ; --i, val /= base)
        buf[i] = "0123456789abcdef"[val % base];

    return &buf[i+1];
}

gint
add_digits(gint num)
{
    gchar *p;
    gint sum = 0;

    p = itoa(num, 10);
    while(*p != '\0')
    {
        gchar c = *p;
        p++;
        sum += atoi(&c);
    }
    return sum;
}

