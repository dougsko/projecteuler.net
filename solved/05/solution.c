/* projecteuler.net
 * Problem 5 
 * Q. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 * A. 232792560
 */

#include <stdio.h>

int test(int maybe){
    int rem;
    int i=1;

    for(i; i <= 20; i++){
       rem = maybe % i;
       if(rem){
           return 0;
       }
    }
    return 1;
}

int main(){
    int i=21;

    while(i != 0){
        if(test(i)){
            printf("The solution is: %d\n", i);
            return 0;
        }
        i++;
    }
}


        
