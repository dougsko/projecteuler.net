#include <pgapack.h>
#include "../tools/helpers.h"

GPtrArray *
read_data(gchar *filename)
{
    GArray *row_array;
    gchar *contents;
    gchar **rows, **elements;
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
    
    g_array_free(row_array, TRUE);
    
    return tri_data;
}

gdouble 
solution_score(PGAContext *ctx, int p, int pop)
{
    GArray *row;
    GPtrArray *triangle;
    gint i, index, sum;

    triangle = read_data("triangle.txt");
    //triangle = pop->data;
    row = g_array_new (FALSE, FALSE, sizeof (gint));
    
    index = 0;
    row = g_ptr_array_index(triangle, 0);
    sum = g_array_index(row, gint, 0);

    for(i=1; i < triangle->len - 1; i++)
    {
        row = g_ptr_array_index(triangle, i);
        if(PGAGetBinaryAllele(ctx, p, pop, i) == 0)
        {
            sum += g_array_index(row, gint, index);
        }
        else
        {
            index++;
            sum += g_array_index(row, gint, index);
        }
    }

    //entity->fitness = sum;
    
    //g_ptr_array_free(triangle, TRUE);
    //g_array_free(row, TRUE);

    printf("%d\n", sum);
    return((gdouble) sum);
}


double NumberOfSetBits(PGAContext *, int, int);

/*******************************************************************
*                   user main program                              *
*******************************************************************/
int main( int argc, char **argv ) {
    PGAContext *ctx;
    int seed;
    
    srandom(time(NULL));
    seed = random() % 1000;
    
    ctx = PGACreate(&argc, argv, PGA_DATATYPE_BINARY, 101, PGA_MAXIMIZE);
    //PGASetRandomSeed(ctx, seed);
    
    PGASetPopSize(ctx, 500);
    PGASetFitnessType(ctx, PGA_FITNESS_RANKING);
    PGASetCrossoverType(ctx, PGA_CROSSOVER_UNIFORM );
    PGASetStoppingRuleType(ctx, PGA_STOP_NOCHANGE);
    PGASetUp(ctx);
    PGARun(ctx, solution_score);
    PGADestroy(ctx);
    
    return(0);
}


/*******************************************************************
*               user defined evaluation function                   *
*   ctx - contex variable                                          *
*   p   - chromosome index in population                           *
*   pop - which population to refer to                             *
*******************************************************************/
double NumberOfSetBits(PGAContext *ctx, int p, int pop) {
    int i, nbits, stringlen;

    stringlen = PGAGetStringLength(ctx);
    
    nbits = 0;
    for ( i=0; i<stringlen; i++ )
	if ( PGAGetBinaryAllele(ctx, p, pop, i) )
	    nbits++;
    
    return((double) nbits);
}

