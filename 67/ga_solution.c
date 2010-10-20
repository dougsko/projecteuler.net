/*
 * Includes
 */
#include "gaul.h"
#include "../tools/helpers.h"

/* return an array of arrays, each sub array
 * is a row of data
 */
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

boolean
solution_gen_hook(gint generation, population *pop)
{
    /*
    gint best_yet = 6915;

    if(ga_get_entity_from_rank(pop,0)->fitness > best_yet)
        return FALSE;
    */

    if(generation % 20 == 0)
    {
        //printf("Generation = %d\n", generation);
        printf("%0.f\n", ga_get_entity_from_rank(pop,0)->fitness);
    }

    /*
    if(ga_get_entity_from_rank(pop,0)->fitness == ga_get_entity_from_rank(pop,2)->fitness)
    {
        printf("Solutions have converged!\n");        
        return FALSE;
    }    
    */
    return TRUE;
}

boolean 
solution_score(population *pop, entity *entity)
{
    GArray *row;
    GPtrArray *triangle;
    gint i, index, sum;

    //triangle = read_data("triangle.txt");
    triangle = pop->data;
    row = g_array_new (FALSE, FALSE, sizeof (gint));
    
    index = 0;
    row = g_ptr_array_index(triangle, 0);
    sum = g_array_index(row, gint, 0);

    for(i=1; i < triangle->len - 1; i++)
    {
        row = g_ptr_array_index(triangle, i);
        if(ga_bit_get(entity->chromosome[0], i) == 0)
        {
            sum += g_array_index(row, gint, index);
        }
        else
        {
            index++;
            sum += g_array_index(row, gint, index);
        }
    }

    entity->fitness = sum;
    
    //g_ptr_array_free(triangle, TRUE);
    //g_array_free(row, TRUE);

    return TRUE;
}


gint 
main(int argc, char **argv)
{
    population *pop = NULL;	/* Population of solutions. */
    int seed;	/* Random number seed. */

    srandom(time(NULL));
    seed = random();

    /*
    printf("ProjectEuler.net Problem 67 - GA Solution\n");
    printf("Random number seed is %d\n", seed);
    printf("\n");
    */

    random_seed(seed);

    pop = ga_genesis_bitstring(
        2000,			/* const int              population_size */
        1,				/* const int              num_chromo */
        101,			/* const int              len_chromo */
        solution_gen_hook,			/* GAgeneration_hook      generation_hook */
        NULL,			/* GAiteration_hook       iteration_hook */
        NULL,			/* GAdata_destructor      data_destructor */
        NULL,			/* GAdata_ref_incrementor data_ref_incrementor */
        solution_score,		/* GAevaluate             evaluate */
        ga_seed_bitstring_random,	/* GAseed                 seed */
        NULL,			/* GAadapt                adapt */
        ga_select_one_bestof2,	/* GAselect_one           select_one */
        ga_select_two_bestof2,	/* GAselect_two           select_two */
        ga_mutate_bitstring_multipoint,	/* GAmutate               mutate */
        ga_crossover_bitstring_doublepoints,	/* GAcrossover            crossover */
        NULL,			/* GAreplace              replace */
        read_data("triangle.txt")			/* vpointer	User data */
    );

    ga_population_set_parameters(
        pop,			/* population      *pop */
        GA_SCHEME_DARWIN,	/* const ga_scheme_type     scheme */
        GA_ELITISM_PARENTS_DIE,	/* const ga_elitism_type   elitism */
        0.9,			/* double  crossover */
        0.25,			/* double  mutation */
        0.001              	/* double  migration */
     );

    ga_evolution(
        pop,		/* population              *pop */
        100		/* const int               max_generations */
    );

    if((gint) ga_get_entity_from_rank(pop,0)->fitness > 7251)
    {
        printf("The final solution with seed = %d had score %d\n\n",
            seed, (gint) ga_get_entity_from_rank(pop,0)->fitness);
    }
  
  ga_extinction(pop);

  exit(EXIT_SUCCESS);
}


