/* Helper functions for projecteuler.net problems. */

#include <string.h>

int is_prime(long value){
    long j, r, rold, rnew;
    r = 0;
    rnew = 1;
    do {
        rold = r;
        r = rnew;
        rnew = ( r + ( value / r ) );
        rnew >>= 1;
    } while( rold != rnew );
        for (j = 2; ( j <= rnew ); ++j){
            if ( value % j == 0 )
                return 0;
        }
            return 1;
}

double fact(int n){
    double accu = 1;
    int i;
    for(i = 1; i <= n; i++){
        accu *= i;
    }
    return accu;
}


