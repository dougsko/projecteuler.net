/* projecteuler.net
 *
 * Problem 15
 *
 */

#include <stdio.h>
#include <helpers.h>

int main(){
    int m = 20;
    int n = 20;
    double ans;

    ans = fact(2*n)/(fact(n)*fact(m));
    printf("Number of paths in a %ix%i square: %.0f\n", m, n, ans);
    return 0;
}


