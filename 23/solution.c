#include "helpers_23.h"

int 
main(void)
{
    GArray *abundants, *results;
    gint i, j, maybe, good;

    abundants = g_array_new(FALSE, FALSE, sizeof(gint));
    results = g_array_new(FALSE, FALSE, sizeof(gint));

    abundants = get_abundants();
    //print_array(abundants);

    // test numbers here
    for(i=1; i < 28123; i++){
        if(is_sum_of_abundants(i, abundants)){
            g_array_append_val(results, i);
        }
    }

    //print_array(results);
    g_printf("Result: %i\n", sum_array(results));

    g_array_free(abundants, TRUE);
    g_array_free(results, TRUE);


    return 0;        
}
