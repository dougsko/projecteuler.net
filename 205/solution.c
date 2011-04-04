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
    mpf_t win, total, res;
    mp_exp_t expptr;
    gchar *win_s, *total_s, *res_s;

    mpf_init2(win, 256);
    mpf_init2(total, 256);
    mpf_init2(res, 7);
    peter, colin = 0;
    srand(time(NULL));

    // good for 4 decimals so far
    // 0.57315066
    // 0.57314323
    for(i = 0; i <= 10000000; i++)
    {
        for(j = 0; j <= 10000000; j++)
        {
            peter = roll(9, 4);
            colin = roll(6, 6);
            if(peter > colin)
                mpf_add_ui(win, win, 1);
            mpf_add_ui(total, total, 1);
        }
    }
    mpf_div(res, win, total);
    win_s = mpf_get_str(NULL, &expptr, 10, 0, win);
    total_s = mpf_get_str(NULL, &expptr, 10, 0, total);
    res_s = mpf_get_str(NULL, &expptr, 10, 8, res);
    printf("Wins: %s\tTotal: %s\n", win_s, total_s);
    printf("Win percentage = 0.%s\n", res_s);

    mpf_clear(win);
    mpf_clear(total);
    mpf_clear(res);

    return 0;
}
