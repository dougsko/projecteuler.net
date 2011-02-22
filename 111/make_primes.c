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
    gchar *foo;

    mpz_init_set_str(i, "10000000", 10);
    mpz_init_set_str(max, "99999999", 10);

    asprintf(&filename, "data/primes-%03d.gz", num);
    gzfile = gzopen(filename, "w");
    
    while(mpz_cmp(i, max) == -1)
    {
        if(count % 1000000 == 0)
        {
            gzclose(gzfile);
            asprintf(&filename, "data/primes-%03d.gz", num);
            gzfile = gzopen(filename, "w");
            foo = mpz_get_str(NULL, 10, i);
            mpz_clear(i);
            mpz_init_set_str(i, foo, 10);
            num++;
            count = 1;
        }
        count++;
        mpz_nextprime(i, i);
        gzprintf(gzfile, "%s\n", mpz_get_str(NULL, 10, i));
    }
    mpz_clear(i);
    mpz_clear(max);
    gzclose(gzfile);

    return 0;
}

