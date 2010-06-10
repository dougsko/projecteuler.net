#include "helpers_23.h"

gint
test_factors(){
    gint i = 28;
    GArray *facts;

    facts = g_array_new(FALSE, FALSE, sizeof(gint));
    facts = factors(i, facts);

    /* The fourth element of the array should be 7 */
    if(g_array_index(facts, gint, 4) == 7){
        return 1;
    }
    return 0;
}

gint
test_sum_array(){
    GArray *array;
    gint sum;
    gint i, j, k, l;
    i = 1;
    j = 2;
    k = 3;
    l = 4;

    array = g_array_new(FALSE, FALSE, sizeof(gint));

    g_array_append_val(array, i);
    g_array_append_val(array, j);
    g_array_append_val(array, k);
    g_array_append_val(array, l);

    sum = sum_array(array);
    if(sum == 10){
        return 1;
    }
    return 0;
}

gint
test_is_abundant(){
    GArray *facts;
    gint i = 12;
    gint j = 14;
    gint res1, res2;

    facts = g_array_new(FALSE, FALSE, sizeof(gint));
    facts = factors(i, facts);

    res1 = is_abundant(i, facts);
    g_array_free(facts, TRUE);

    facts = g_array_new(FALSE, FALSE, sizeof(gint));
    facts = factors(j, facts);

    res2 = is_abundant(j, facts);
    g_array_free(facts, TRUE);

    if((res1  == 1) && (res2 == 0)){
        return 1;
    }
    else{
        return 0;
    }
}



gint 
main(){
    if(test_factors()){
        g_printf("factors passed\n");
    }
    else{
        g_printf("factors failed\n");
    }

    if(test_sum_array()){
        g_printf("sum_array passed\n");
    }
    else{
        g_printf("sum_array failed\n");
    }

    if(test_is_abundant()){
        g_printf("is_abundant passed\n");
    }
    else{
        g_printf("abundant failed\n");
    }

    return 0;
}
