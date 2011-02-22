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
    gint bar;

    omp_set_num_threads(4);

    mpz_init_set_str(i, "1000000", 10);
    mpz_init_set_str(max, "9999999", 10);

    asprintf(&filename, "data/primes-%03d.gz", num);
    gzfile = gzopen(filename, "w");
    free(filename);
    
    while(mpz_cmp(i, max) == -1)
    {
        if(count % 10000 == 0)
        {
            gzclose(gzfile);
            asprintf(&filename, "data/primes-%03d.gz", num);
            gzfile = gzopen(filename, "w");
            free(filename);
            num++;
            count = 1;
        }
        count++;
        mpz_nextprime(i, i);
        foo = mpz_get_str(NULL, 10, i);
        gzprintf(gzfile, "%s\n", foo);
        free(foo);
        bar = mpz_cmp(i, max) - 1;
    }
    gzclose(gzfile);

    return 0;
}

