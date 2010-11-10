#include <stdio.h>
#include <glib.h>
#include "../tools/helpers.h"

/* read file, change commas to spaces and put in GArray */
GArray *
read_data()
{
    gint i, c, num;
    gchar *contents, **letters;
    GArray *encrypted;

    g_file_get_contents("cipher1.txt", &contents, NULL, NULL);
    letters = g_strsplit(contents, ",", -1);
    encrypted = g_array_new(FALSE, FALSE, sizeof (gint));
    for(i = 0; i < g_strv_length(letters); i++)
    {
        num = atoi(letters[i]);
        g_array_append_val(encrypted, num);
    }
    return encrypted;
}

gint
main(gint argc, gchar **argv)
{
    gint i, c, num;
    gchar *contents, **letters;
    GArray *encrypted, *shifted;

    encrypted = read_data();

    /* try shifting and xoring with orig */
    shifted = array_copy(encrypted);
    g_array_remove_range(shifted, 0, 3);
    for(i = 0; i < shifted->len; i++)
    {
        g_print("%c ", g_array_index(encrypted,gint, i) ^ g_array_index(shifted, gint, i));
    }
    g_print("\n\n%c \n", 107 ^ 42);


    g_array_free(encrypted, TRUE);
    g_array_free(shifted, TRUE);
    return 0;

}
