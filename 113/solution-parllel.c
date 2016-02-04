#include "pe.h"
#include <omp.h>
#include <stdio.h>

int
main()
{
    mpz_t base, upper, start, k, count;
    gchar *num_str;

    int sj, sstop, tn, tj, tstop;
    int foo(mpz_t j, mpz_t upper);
    omp_set_num_threads(8);

    sj = -1;
    sstop = 0;

    mpz_init(base);
    mpz_init(upper);
    mpz_init(k);
    mpz_init(count);

    mpz_set_ui(count, 0);
    mpz_set_ui(base, 10);
    mpz_pow_ui(upper, base, 100);

    #pragma omp parallel private(tn,tj,tstop)
    {
        tn = omp_get_thread_num();
        while(!sstop)
        {
            #pragma omp critical
            {
                sj++;
                tj = sj;
            }
            tstop = foo(k, upper);
            if (tstop)
            {
                sstop = 1;
                #pragma omp flush(sstop)
            }
            printf("Thread %d, iteration %d, sstop=%d\n",tn,tj,sstop);
        }
    }
}

int
foo(mpz_t j, mpz_t upper)
{
    int condition;

    condition = mpz_cmp(j, upper);
    usleep(100000);
    return condition;
}

/*
    while(mpz_cmp(k, upper) < 0)
    {
        num_str = mpz_get_str(NULL, 10, k);
    
        if(! is_bouncy(num_str))
            mpz_add_ui(count, count, 1);
        
        mpz_add_ui(k, k, 1);
        free(num_str);
    }
    mpz_sub_ui(count, count, 1);
    g_print("count = %s\n", mpz_get_str(NULL, 10, count));

    return 0;
}
*/
