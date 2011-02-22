#include "../tools/pe.h"

gint
main()
{
    FILE *file;
    gint n = 10;
    gint min = pow(10,n-1);
    gint max = pow(
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

