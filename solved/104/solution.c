#include "../tools/pe.h"
#include <time.h>


gint
main()
{
    gchar *foo, *bar, *oof;
    GString *one_to_nine, *first_nine_string, *last_nine_string;
    gint i;
    gint k;
    mpz_t rop;
    GArray *first_nine_array, *last_nine_array;

    mpz_init_set_ui(rop, 1);
    
    one_to_nine = g_string_new("123456789");
    first_nine_string = g_string_new(NULL);
    last_nine_string = g_string_new(NULL);
    first_nine_array = g_array_new(FALSE, FALSE, sizeof(gint));
    last_nine_array = g_array_new(FALSE, FALSE, sizeof(gint));

    k = 2700;
    while(TRUE)
    {
        // Get next fib number
        mpz_fib_ui(rop, k); 

        foo = mpz_get_str(NULL, 10, rop);
    
        // put first and last nine into arrays and sort them
        bar = g_strndup(foo, 9);
        i = 0;
        while(bar[i] != '\0')
        {
            g_array_append_val(first_nine_array, bar[i]);
            i++;
        }
        g_free(bar);
    
        oof = g_utf8_strreverse(foo, -1);
        bar = g_strndup(oof, 9);

        i = 0;
        while(bar[i] != '\0')
        {
            g_array_append_val(last_nine_array, bar[i]);
            i++;
        }
        g_free(bar);
        g_free(foo);
        g_free(oof);

        g_array_sort(first_nine_array, (GCompareFunc)g_strcmp0);
        g_array_sort(last_nine_array, (GCompareFunc)g_strcmp0);

        // Put first and last nine arrays back into strings
        gchar digit;
        for(i = 0; i < first_nine_array->len; i++)
        {
            digit = g_array_index(first_nine_array, gint, i);
            g_string_append_c(first_nine_string, digit);

            digit = g_array_index(last_nine_array, gint, i);
            g_string_append_c(last_nine_string, digit);
        }
        //printf("%s\n\n", first_nine_string->str);
    
        if(g_string_equal(one_to_nine, first_nine_string) &&
                g_string_equal(one_to_nine, last_nine_string)) 
        //if(g_string_equal(one_to_nine, first_nine_string))
        {
            printf("\n\n-----SOLUTION-----\nk = %d\n------------------\n", k);
            break;
        }
    
        k++; 

        g_array_remove_range(first_nine_array, 0, first_nine_array->len);
        g_array_remove_range(last_nine_array, 0, last_nine_array->len);

        g_string_erase(first_nine_string, 0, first_nine_string->len);
        g_string_erase(last_nine_string, 0, last_nine_string->len);
        
    }

    mpz_clear(rop);
    g_string_free(one_to_nine, TRUE);
    g_string_free(first_nine_string, TRUE);
    g_string_free(last_nine_string, TRUE);

    g_array_free(first_nine_array, TRUE);
    g_array_free(last_nine_array, TRUE);
    
    return 0;
}
