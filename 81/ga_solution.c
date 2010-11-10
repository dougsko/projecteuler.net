/* projecteuler.net
 *
 * problem 81
 *
 * answer: 
 *
 * 532246
 *
 */
#include "gaul.h"
#include "../tools/helpers.h"

#define GA_STRUGGLE_NUM_POPS    20

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
        elements = g_strsplit(rows[i], ",", -1);
        for(j=0; j < g_strv_length(elements); j++)
        {
            k = atoi(elements[j]);
            g_array_append_val(row_array, k);
        }
        g_ptr_array_add(tri_data,row_array);
    }
    
    g_array_free(row_array, TRUE);

    //row_array = g_ptr_array_index(tri_data, tri_data->len-2);
    //g_print("%d\n", g_array_index(row_array, gint, row_array->len-1));
    
    return tri_data;
}

boolean
solution_gen_hook(gint generation, population *pop)
{
    gint best_yet = 0;

    if(ga_get_entity_from_rank(pop,0)->fitness > best_yet)
        return FALSE;

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
    gint i, index, sum, row_num;

    triangle = pop->data;
    row = g_array_new (FALSE, FALSE, sizeof (gint));
    
    index = 0;
    row_num = 0;
    row = g_ptr_array_index(triangle, 0);
    sum = g_array_index(row, gint, 0);

    i = 0;
    //g_print("%d\n", row->len);
    //return 0;
    while( TRUE )
    {
        // go down
        if(ga_bit_get(entity->chromosome[0], i) == 0)
        {
            if(row_num != triangle->len-2)
                row_num++;    
            else if(index != row->len-1)
                index++;
        }
        else // go right
        {
            if(index != row->len-1)
                index++;
            else if(row_num != triangle->len-2)
                row_num++;
        }
        //g_print("row_num= %d, index= %d\t", row_num, index);
        row = g_ptr_array_index(triangle, row_num);
        //g_print("%d\n", g_array_index(row, gint, index));
        sum += g_array_index(row, gint, index);
        if(row_num == 79 && index == 79)
            break;
        i++;
    }
    entity->fitness = 1.0 / sum;
    
    return TRUE;
}


gint 
main(int argc, char **argv)
{
    population *pop[GA_STRUGGLE_NUM_POPS];	/* Population of solutions. */
    gint i;
    gint seed;	/* Random number seed. */
    gfloat highest = 0;

    srandom(time(NULL));
    seed = random();

    random_seed(seed);

    for (i=0; i < GA_STRUGGLE_NUM_POPS; i++)
    {
        pop[i] = ga_genesis_bitstring(
            1000,			/* const int              population_size */
            1,				/* const int              num_chromo */
            101,			/* const int              len_chromo */
            NULL,			/* GAgeneration_hook      generation_hook */
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
            read_data("matrix.txt")			/* vpointer	User data */
        );

        ga_population_set_parameters(
            pop[i],			/* population      *pop */
            GA_SCHEME_DARWIN,	/* const ga_scheme_type     scheme */
            GA_ELITISM_PARENTS_DIE,	/* const ga_elitism_type   elitism */
            0.9,			/* double  crossover */
            0.50,			/* double  mutation */
            0.1              	/* double  migration */
        );
    }

    ga_evolution_archipelago(
        GA_STRUGGLE_NUM_POPS,    
        pop,		/* population              *pop */
        100		/* const int               max_generations */
    );

    for (i=0; i < GA_STRUGGLE_NUM_POPS; i++)
    {
        if((gfloat) ga_get_entity_from_rank(pop[i],0)->fitness > highest)
        {
            highest = (gfloat) ga_get_entity_from_rank(pop[i],0)->fitness;
        }
  
        ga_extinction(pop[i]);
    }
    //g_print("The final solution with seed = %d\nscore= %0.f\nfitness= %f\n\n", seed, 100/(highest*100), highest);
    g_print("%0.f\n", 100/(highest*100));

  exit(EXIT_SUCCESS);
}


