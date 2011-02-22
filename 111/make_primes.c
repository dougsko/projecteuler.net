#include "../tools/pe.h"

gint
main()
{
    FILE *file;
    gint n = 7;
    gint min = pow(10,n-1);
    file = fopen("primes.txt", "w");
    gchar *i;

    i = itoa(min, 10);
    while(strlen(i = next_prime(i)) == n)
    {
        fprintf(file, "%s\n", i);
    }
    fclose(file);

    return 0;
}

