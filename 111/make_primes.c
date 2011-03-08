#include "../tools/pe.h"
#include <zlib.h>

gint
main()
{
    FILE *file;
    file = fopen("primes.gz", "w");
    mpz_t i;
    mpz_t max;
    gint count = 0;
    gzFile *gzfile;
    gint j;
    gchar *start, *finish;
    
    gzfile = gzdopen(fileno(file), "wb");
    mpz_init_set_str(i, "1000000000", 10);
    mpz_init_set_str(max, "9999999999", 10);
    start = "1000000000";
    finish = "9999999999";

    for(j = 10; strlen(mpz_get_str(NULL, 10, i)) == 10; )
    //while(mpz_cmp(i, max) == -1)
    {
        //mpz_nextprime(i, i);
        if(mpz_probab_prime_p(i, 5))
            printf("%s\n", mpz_get_str(NULL, 10, i) );

        //gzprintf(gzfile, "%s\n", mpz_get_str(NULL, 10, i) );
    }

    gzclose(gzfile);
    fclose(file);

    return 0;
}

