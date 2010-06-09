/* projecteuler.net
 * Problem 4 
 *
 * A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 *
 * A. 580085 = 995 * 583
 *
 */

#include <stdio.h>

int reverse(int num){
    int mod, rev = 0; 

    while(num > 0) 
    { 
        mod = num % 10; 
        rev = (rev * 10) + mod; 
        num = num / 10; 
    } 
    return rev; 
} 

int is_palindrome(int canidate){
        int rev;

        rev = reverse(canidate);
        if(rev == canidate)
            return 1;
        return 0;
}


int main(){
    int maybe, i, j, biggest, fac1, fac2;

    for(i=900; i <= 999; i++){
        for(j=900; j <= 999; j++){
            maybe = i * j;
            if(is_palindrome(maybe)){
                biggest = maybe;
                fac1 = i;
                fac2 = j;
            }
        }
    }
    printf("%i = %i * %i\n", biggest, fac1, fac2);

    return 0;
}
