#include "../tools/helpers.h"
#include <stdlib.h>

    gint num = 1;
    gint digits = 0;

    /*
     * count = 0
     * 1.upto 1000000 do |i|
     *     digits = i.to_s.size
     *     1.upto(1000) do |j|
     *             break if j ** digits > i
     *                 if j ** digits == i
     *                     count += 1
     *                     puts "#{j}^#{digits} = #{i}"
                       end
           end
     * end
     * puts count
     */

gint
digit_count(num)
{
    gint digits = 0;

    while(num > 0)
    {
        num /= 10;
        digits++;
    }
    return digits;
}

gint
main()
{
    gint num, digits;
    gint i = 1;
    gint j = 1;
    gint count = 0;
    gint p = 0;

    while(i > 0)
    {
        digits = digit_count(i);
        for(j=1; pow(j, digits) <= i; j++)
        {
            if(pow(j, digits) == i)
            {
                g_print("%d^%d = %d\n", j, digits, i);
                count++;
            }
        }
        i++;
        if(i % 1000 == 0)
        {
            g_print("count = %d\n", count);
        }
    }

    return 0;
}
