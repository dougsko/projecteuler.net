/* projecteuler.net
 * Problem 1 
 *
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 *
 * A. 233168
 */

#include <stdio.h>

int main(){
    int max = 1000;
    int i;
    int sum = 0;
    int res1, res2;

    for(i=1; i < max; i++){
        res1 = i % 3; 
        res2 = i % 5;
        if((res1 == 0) || (res2 == 0)){
            sum += i;
        }
    }
    printf("Sum: %i\n", sum);
    return 0;
}
