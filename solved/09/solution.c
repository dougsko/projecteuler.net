/* projecteuler.net
 * Problem 9 
 *
 * A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
 *
 * a2 + b2 = c2
 * For example, 32 + 42 = 9 + 16 = 25 = 52.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 *
 */

#include <stdio.h>
#include <math.h>

int main(){
    double a, b, c;

    for(a=1; a < 1000; a++){
        for(b=1; b < 1000; b++){
            c = sqrt(pow(a,2) + pow(b,2));
            if((a+b+c) == 1000){
                printf("a: %f, b: %f, c: %f, product: %f\n", a, b, c, a*b*c);
                return 0;
            }
        }
    }
    return 0;
}
