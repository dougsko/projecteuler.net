/* projecteuler.net
 *
 * Problem 21
 *
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 * If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.
 *
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
 *
 * Evaluate the sum of all the amicable numbers under 10000.
 */

#include <stdio.h>
#include <math.h>

int d(int num){
    int i;
    int sum = 0;

    for(i=2; i <= sqrt(num); i++){
        if( num % i == 0){
            sum += i;
            sum += num / i;
        }
    }
    return sum+1;
}

int main(){
    int sum = 0;
    int i;
    int a,b;
    for(i=1; i < 10000; i++){
        a = d(i);
        b = d(a);
        if((i == b) && (a != b)){
            sum += a;
        }
    }
    printf("%i\n", sum);
    return 0;
}
