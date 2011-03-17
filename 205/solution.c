#include "../tools/pe.h"
#include <time.h>


gint
roll(num_dice, num_sides)
{
    gint sum, i;

    sum = 0;
    for(i = 0; i < num_dice; i++)
    {
        sum += (rand() % num_sides) + 1;
    }
    return sum;
}
    
    
gint
main()
{
    gint i, j, peter, colin, win, total;

    peter, colin, total = 0;
    srand(time(NULL));

    win = 0;
    total = 0;

    for(i = 0; i <= 1000000; i++)
    {
        for(j = 0; j <= 1000000; j++)
        {
            peter = roll(9, 4);
            colin = roll(6, 6);
            if(peter > colin)
                win++;
            total++;
        }
    }
    printf("Wins: %d\tTotal: %d\n", win, total);
    printf("Win percentage = %0.7f\n", (float)win / total);

    return 0;
}
