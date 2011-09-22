#include "../tools/pe.h"

gint
main()
{
    glong max, sum, count = 0;
    GArray *squares;
    GArray *pals;
    gint i;
    gdouble square_root, square;

    max = pow(10, 3);
    square_root = sqrt(max);
    squares = g_array_new(FALSE, FALSE, sizeof (gint));
    pals = g_array_new(FALSE, FALSE, sizeof (gint));

    for(i = 1; i <= square_root; i++)
    {
        square = pow(i, 2);
        printf("%0.f\n", square);
        g_array_append_val(squares, square);
    }

    printf("%f ", &g_array_index(squares, gdouble, 0));


    return 0;
}
