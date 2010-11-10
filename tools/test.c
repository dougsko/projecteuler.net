#include <math.h>

int 
count(int n)
{
    return (int)log10(n) + 1;
}

int
main()
{
    printf("%d\n", count(999));

    return 0;
}
