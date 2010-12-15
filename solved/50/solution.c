#include "helpers.h"

GArray *
make_prime_array(gint num)
{
    GArray *primes;
    int i;
    
    primes = g_array_new(FALSE, FALSE, sizeof(gint));
    for(i = 2; i <= num; i++){
        if(is_prime(i)){
            g_array_append_val(primes, i);
        }
    }
    return primes;
}

int 
main()
{
    GArray *primes;
    GArray *primes_subset;
    gint sum;
    gint i, j, k;
    gint longest_window, biggest_prime;

    longest_window = 0;
    biggest_prime = 0;
    primes = make_prime_array(10000);
    primes_subset = g_array_new(FALSE, FALSE, sizeof(gint));

    for(i=0; i < primes->len - 1; i++){
        for(j=i+1; j < primes->len; j++){
            for(k=i; k <= j; k++){
               g_array_append_val(primes_subset, g_array_index(primes, gint, k));
            }
            sum = sum_array(primes_subset);
            if(is_prime(sum) && sum < 1000000){
                if(primes_subset->len > longest_window){
                    longest_window = primes_subset->len;
                    biggest_prime = sum;
                }
           }
           if(primes_subset)
             g_array_free(primes_subset, TRUE);
           primes_subset = g_array_new(FALSE, FALSE, sizeof(gint));
           sum = 0;
        }
    }
    printf("%d is the sum of %d primes\n", biggest_prime, longest_window);
                  
    if(primes)
      g_array_free(primes, TRUE);
    return 0;
}
