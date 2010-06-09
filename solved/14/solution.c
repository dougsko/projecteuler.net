/* projecteuler.net
 * Problem 14 
 * Q. The following iterative sequence is defined for the set of positive integers:
 *
 * n  n/2 (n is even)
 * n  3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following sequence:
 *
 * 13  40  20  10  5  16  8  4  2  1
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 */

#include <stdio.h>

/* Takes a starting point and returns the chain length */
int algo(int start){
    int new;
    int count = 1;

    while(new != 1){
        if((start % 2)) 
            new = 3 * start + 1;
        else
            new = start / 2;
        start = new;
        count++;
    }
    return count;
}

int main(){
    int old, new, sp, i = 0;

    for(i=1; i < 100; i++){
        new = algo(i);
        if(new > old){
            old = new;
            sp = i;
        }
    }
    printf("start: %i, chain: %i\n", sp, old);
    
    return 0;

}


        
