#include "../tools/pe.h"
#include <zlib.h>

gint
main()
{
    mpz_t i, max;
    gzFile *gzfile;
    gint count = 0;
    gint num = 0;
    gchar *filename;
    gchar *prime;


    mpz_init_set_str(i, "1000", 10);
    mpz_init_set_str(max, "9999", 10);

    asprintf(&filename, "data/primes-%04d.gz", num);
    gzfile = gzopen(filename, "w");
    free(filename);
    
    while(mpz_cmp(i, max) == -1)
    {
        if(count % 1000 == 0)
        {
            gzclose(gzfile);
            asprintf(&filename, "data/primes-%04d.gz", num);
            gzfile = gzopen(filename, "w");
            free(filename);
            num++;
            count = 1;
        }
        count++;
        mpz_nextprime(i, i);
        prime = mpz_get_str(NULL, 10, i);
        gzprintf(gzfile, "%s\n", prime);
        free(prime);
    }
    mpz_clear(i);
    mpz_clear(max);
    gzclose(gzfile);

    return 0;
}
