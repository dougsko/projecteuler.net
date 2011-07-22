#include "../tools/pe.h"

/*
 * projecteuler.net
 *
 * problem 31
 *
 *
 * In England the currency is made up of pound, £, and pence, p, and
 * there are eight coins in general circulation:
 *
 * 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
 * It is possible to make £2 in the following way:
 *
 * 1x1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
 * How many different ways can £2 be made using any number of coins?
 *
 *
*/

gint 
main()
{
    gint p1, p2, p5, p10, p20, p50, p100, p200, sum, count = 0;

    for(p1 = 0; p1 <= 200; p1++)
    {
        for(p2 = 0; p2 <= 100; p2++)
        {
            for(p5 = 0; p5 <= 40; p5++)
            {
                for(p10 = 0; p10 <= 20; p10++)
                {
                    for(p20 = 0; p20 <= 10; p20++)
                    {
                        for(p50 = 0; p50 <= 4; p50++)
                        {
                            for(p100 = 0; p100 <= 2; p100++)
                            {
                                for(p200 = 0; p200 <= 1; p200++)
                                {
                                    if(p1*1 + p2*2 + p5*5 + p10*10 + p20*20 + p50*50 + p100*100 + p200*200 == 200)
                                    {
                                        count++;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    printf("Final count = %d\n", count);
    return 0;
}
