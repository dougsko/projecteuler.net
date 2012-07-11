#include <stdlib.h>
#include <stdio.h>
#include <omp.h>

int
divs(int n)
{
    int count = 1;
    int i;
    int max = n/2+1;

    for( i = 1; i < max; i++)
    {
        if( n % i == 0 )
            count++;
    }
    return count;
}


int
main(int argc, char **argv)
{
    int max, divs1, divs2, i, count;
    /*
    if(argv[1] == NULL)
    {
        printf("You must set a maximum value.\n");
        printf("./solution 10000000\n");
        exit 1;
    }
    */
    max = atoi(argv[1]) - 1;
    count = 0;

    omp_set_num_threads(4);

    #pragma omp parallel for reduction(+:count) private(divs1, divs2)
    for( i = 1; i <= max; i++)
    {
        divs1 = divs(i);
        divs2 = divs(i+1);
        if(divs1 - divs2 == 0)
        {
            count++;
            printf("%0.0f%%\n", (double)i/max*100);
        }
    }
    printf("Answer is %d\n", count);

    return 0;
}
