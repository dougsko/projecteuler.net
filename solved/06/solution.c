/* projecteuler.net
 * Problem 6 
 *
 * The sum of the squares of the first ten natural numbers is,
 *
 * 12 + 22 + ... + 102 = 385
 * The square of the sum of the first ten natural numbers is,
 *
 * (1 + 2 + ... + 10)2 = 552 = 3025
 * Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
 *
 * Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 * 
 * A. 25164150
 *
 */

#include <stdio.h>
#include <math.h>

int main(){
    double sum, sum_of_sq, sq_of_sum = 0;
    int limit = 100;
    int i = 1;
    double diff;

    for(i; i <= limit; i++){
        sum_of_sq += pow(i,2);
        sum += i;
    }
    sq_of_sum = pow(sum, 2);
    diff = sq_of_sum - sum_of_sq;
    printf("sum_of_sq: %.0lf\nsq_of_sum: %.0lf\ndiff: %.0lf\n", sum_of_sq, sq_of_sum, diff);

    return 0;
}
