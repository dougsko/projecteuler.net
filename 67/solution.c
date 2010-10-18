#include <helpers.h>

void
foo(gchar *bar)
{
    g_print("%s\n", bar);
}

GPtrArray *
read_data(gchar *filename)
{
    GArray *row_array;
    gchar *contents, *row;
    gchar **rows, **elements;
    GError *error = NULL;
    gint i, j, k, num;
    GPtrArray *tri_data;

    tri_data = g_ptr_array_new();
    row_array = g_array_new(FALSE, FALSE, sizeof (gint));

    if(! g_file_get_contents(filename, &contents, NULL, &error))
        printf("%s\n", error->message);

    rows = g_strsplit(contents, "\n", -1);
    for(i=0; i < g_strv_length(rows); i++)
    {
        g_ptr_array_add(tri_data,rows[i]);
    }
    
    g_free(elements);
    g_free(rows);
    g_free(contents);
    g_free(row_array);

    return tri_data;
}

int 
main(int argc, char **argv)
{
    GArray *row;
    GPtrArray *triangle;
    gint count, i, j, index, sum;
    gint biggest_sum = 0;
    gchar **elements;

    triangle = read_data("triangle_small.txt");
    
    for(i=0; i < triangle->len; i++)
    {
        elements = g_strsplit(g_ptr_array_index(triangle, i), " ", -1);
        g_print("%d\n", g_strv_length(elements));
    }
    return 0;
    
    //while(biggest_sum <= 0)
    for(j=0; j <= 10000; j++)
    {
        index = 0;
        row = g_ptr_array_index(triangle, 0);
        sum = g_array_index(row, gint, 0);

        for(i=1; i < triangle->len; i++)
        {
            row = g_ptr_array_index(triangle, i);
            //print_array(row);
            if(rand() % 2)
            {
                //g_print("%d += %d\n", sum, g_array_index(row, gint, index));
                sum += g_array_index(row, gint, index);
            }
            else
            {
                index += 1;
                //g_print("%d += %d\n", sum, g_array_index(row, gint, index));
                sum += g_array_index(row, gint, index);
            }
        }
        if(sum > biggest_sum)
        {
            biggest_sum = sum;
            //g_print("%d\n", biggest_sum);
        }
    }
    //g_print("%d\n", biggest_sum);

    g_ptr_array_free(triangle, TRUE);
    g_array_free(row, TRUE);

    return 0;
}
