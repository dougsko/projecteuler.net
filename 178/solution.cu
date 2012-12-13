#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <cuda.h>
#include <gmp.h>

/*
__device__ int
is_pandigital(char *n)
{
    int i;
    const char *foo = n;
    char *test = "0123456789";
    char *s;
    char c;

    while(*test != '\0')
    {
        c = *test;
        s = c;
        if(strstr(foo, &s) == NULL)
            return 0;
        test++;
    }

    return 1;
}
*/

__device__ int
is_step(char *n)
{
    char *s = n;
    char *p = n;
    char c, d;

    while (*s != '\0'){
        s = p + 1;
        c = *p;
        d = *s;
        //printf("%c - %c = %d\n",c, d, abs(c-d));
        if(abs(c-d) != 1)
            return 0;
        p++;
        s++;
    }
    return 1;
}

__device__ int
get_global_index()
{
    return  blockIdx.x * blockDim.x + threadIdx.x;
}

__global__ void
pandigital_step(char **a, char **good, int N)
{
    int index = get_global_index();
    //if(is_pandigital(a[index]) == 1 && is_step(a[index]) == 1)
    if(a[index] == "1")
    {
        good[index] = a[index];
    }
}

int
main(int argc, char **argv)
{
    char **a_h, **a_d, **good_h, **good_d;
    char *max_s = argv[1];
    mpz_t max, i;
    const int N = 10;
    size_t size = N * sizeof(char **);
    int j, k;
    char *string;
    int block_size = 4;
    int n_blocks = N/block_size + (N % block_size == 0 ? 0:1);

    mpz_init(max);
    mpz_init(i);

    mpz_set_ui(i, 0);
    mpz_set_str(max, max_s, 10);
    a_h = (char **)malloc(size);
    good_h = (char **)malloc(size);
    cudaMalloc((void **) &a_d, size);
    cudaMalloc((void **) &good_d, size);

    k = 0;
    //while(mpz_cmp(i, max) <= 0)
    //{
        string = mpz_get_str(NULL, 10, i);
        string = argv[1];
        //printf("%s\n",  string);
        a_h[k] = string;
        mpz_add_ui(i, i, 1);
        k++;
    //}

    cudaMemcpy(a_d, a_h, size, cudaMemcpyHostToDevice);
    cudaMemcpy(good_d, good_h, size, cudaMemcpyHostToDevice);

    pandigital_step <<< n_blocks, block_size >>> (a_d, good_d, sizeof(a_d));

    cudaMemcpy(good_h, good_d, sizeof(char **)*N, cudaMemcpyDeviceToHost);

    j = 0;
    while(good_h[j] != NULL)
    {
        printf("%s\t%s\n", good_h[j], a_h[j]);
        j++;
    }

    free(a_h);
    free(good_h);
    cudaFree(good_d);
    cudaFree(a_d);
    mpz_clear(max);
    mpz_clear(i);



    return 0;
}
