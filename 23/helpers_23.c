#include "helpers_23.h"

GArray*
factors(gint num, GArray *facts)
{
    gint i= 1;
    gint second_fact;

    g_array_append_val(facts, i);
    for(i=2; i < sqrt(num); i++){
        if(num % i == 0){
            g_array_append_val(facts, i);
            if((i != 1) && (i != 0)){
                second_fact = num / i;
                if(second_fact != num){
                    g_array_append_val(facts, second_fact);
                }
            }
        }
    }
    return facts;
}

gint
sum_array(GArray *array)
{
    gint sum = 0;
    gint i;

    for(i=0; i < array->len; i++){
        sum += g_array_index(array, gint, i);
    }
    //g_printf("The sum of the array is: %i\n", sum);
    return sum;
}

gint
is_abundant(gint num, GArray *facts)
{
    gint sum;

    sum = sum_array(facts);
    if(sum > num){
        //g_printf("%i is abundant\n", num);
        return 1;
    }
    return 0;
}

void
print_array(GArray *array)
{
    gint i;

    for(i=0; i < array->len; i++){
        g_printf("%i\n", g_array_index(array, gint, i));
    }
}

gint
is_sum_of_abundants(gint num, GArray *abundants)
{
    gint i, maybe;
    GArray *facts;

    for(i=0; i < abundants->len; i++){
        maybe = num - g_array_index(abundants, gint, i);
        if(maybe > 0){
            facts = g_array_new(FALSE, FALSE, sizeof(gint));
            facts = factors(maybe, facts);
            if(is_abundant(maybe, facts)){
                g_array_free(facts, TRUE);
                return 0;
            }
            g_array_free(facts, TRUE);
        }
    }
    return 1;
}

GArray*
get_abundants(){
    GArray *abundants, *facts;
    gint i;

    abundants = g_array_new(FALSE, FALSE, sizeof(gint));

    for(i=1; i < 28124; i++){
        facts = g_array_new(FALSE, FALSE, sizeof(gint));
        facts = factors(i, facts);
        if(is_abundant(i, facts)){
            g_array_append_val(abundants, i);
        }
        g_array_free(facts, TRUE);
    }
    return abundants;
}
