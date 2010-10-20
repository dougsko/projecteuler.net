#include "../tools/helpers.h"

/* return an array of arrays, each sub array
 * is a row of data
 */
GPtrArray *
read_data(gchar *filename)
{
    GArray *row_array;
    gchar *contents, *row;
    gchar **rows, **elements;
    GError *error = NULL;
    gint i, j, k;
    GPtrArray *tri_data;

    tri_data = g_ptr_array_new();
    row_array = g_array_new(FALSE, FALSE, sizeof (gint));

    /* read file */
    contents = read_file(filename);

    /* split data into a GPointerArray of GArrays */
    rows = g_strsplit(contents, "\n", -1);
    for(i=0; i < g_strv_length(rows); i++)
    {
        row_array = g_array_new(FALSE, FALSE, sizeof (gint));
        elements = g_strsplit(rows[i], " ", -1);
        for(j=0; j < g_strv_length(elements); j++)
        {
            k = atoi(elements[j]);
            g_array_append_val(row_array, k);
        }
        g_ptr_array_add(tri_data,row_array);
    }
    
    g_error_free(error);
    g_array_free(row_array, TRUE);
    
    return tri_data;
}

int 
main(int argc, char **argv)
{
    GArray *rows, *row;
    GPtrArray *triangle;
    gint count, i, j, k, m, index, sum;
    gint biggest_sum = 0; //6594;

    triangle = read_data("triangle.txt");
    row = g_array_new (FALSE, FALSE, sizeof (gint));
    
    for(m=0; m <= 1000000; m++)
    {
    for(k=0; k <= 10000000; k++)
    {
        index = 0;
        row = g_ptr_array_index(triangle, 0);
        sum = g_array_index(row, gint, 0);

        for(i=1; i < triangle->len - 1; i++)
        {
            row = g_ptr_array_index(triangle, i);
            if(rand() % 2)
            {
                sum += g_array_index(row, gint, index);
            }
            else
            {
                index++;
                sum += g_array_index(row, gint, index);
            }
            if(sum > biggest_sum)
            {
                biggest_sum = sum;
                g_print("%d\n", biggest_sum);
            }
        }
    }
    }
    //g_print("%d\n", biggest_sum);
    
    g_ptr_array_free(triangle, TRUE);
    g_array_free(row, TRUE);

    return 0;
}
