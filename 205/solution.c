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
    gint i, j, peter, colin;
    gfloat win, total;

    srand(time(NULL));
    peter, colin, total = 0;

    win = 0;
    total = 0;

    // 0.57315066
    // 0.5732091
    for(i = 0; i <= 10000000; i++)
    {
        for(j = 0; j <= 1000; j++)
        {
            peter = roll(9, 4);
            colin = roll(6, 6);
            if(peter > colin)
                win++;
            total++;
        }
    }
    printf("Wins: %.0f\tTotal: %.0f\n", win, total);
    printf("Win percentage = %0.7f\n", win / total);

    return 0;
}
