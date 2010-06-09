/* projecteuler.net
 * Problem 10
 *
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 *
 * A. 142913828922
 *
 */

#include <stdio.h>
#include <helpers.h>

int main(){
    int i;
    double sum = 0;
    int limit = 2000000;

    for(i=2; i < limit; i++){
        if(is_prime(i)){
            sum += i;
            //printf("Prime: %i\tTally: %0.0f\n", i, sum);
        }
    }
    printf("Sum of all primes under %i: %0.0f\n", limit, sum);
    return 0;
}
