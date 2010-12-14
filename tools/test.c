#include "helpers.h"

// 215 - 1 thread
// 99 - 2 threads
// 39.57s - 4 threads
int 
main()
{
    gint i, j;
    gfloat p;

    omp_set_num_threads(4);
    #pragma omp parallel for default(shared)
    for(j = 0; j <= 100000; j++)
    {
        for(i = 0; i <= 20000; i++)
            p = phi(i);
    }

    return 0;
}
