/* projecteuler.net
 * Problem 3
 *
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 *
 * A. 6857
 */



#include <stdio.h>
#include <helpers.h>

int main(){
    int i;
    float target = 600851475143;

    for(i=1; i < 600851475143; i++){
        if((600851475143 % i) == 0){
            if(is_prime(i)){
                printf("canidate: %i\n", i);
            }
        }
    }

    return 0;
}
