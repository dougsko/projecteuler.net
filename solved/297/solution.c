#include <stdio.h>
 
#define N 100000000000000000LL
 
long long int answer;

int 
main(int argc, char **argv) 
{
    long long int f[2000];
    long long int fs[2000];
    int fn, l;
    long long int n;
 
    f[0] = 0;
    f[1] = 1;
    f[2] = 2;
    fs[0] = 0;
    fs[1] = 1;
    fs[2] = 2;
    for (fn=3;; fn++) 
    {
        f[fn] = f[fn-1]+f[fn-2];
        fs[fn] = fs[fn-1]+f[fn-1]+fs[fn-2];
        if (f[fn] > N)
            break;
    }
 
    l = fn-1;
    n = N;
    answer = 0;
    while (l) 
    {
        if (n >= f[l]) {
            answer += fs[l-1]+n-f[l];
            n -= f[l];
        }
        l--;
    }
 
    printf ("answer: %lld\n", answer);
}
