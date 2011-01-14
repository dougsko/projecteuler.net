#include "../tools/pe.h"

/* The smallest number expressible as the sum of a prime square, prime
 * cube, and prime fourth power is 28. In fact, there are exactly four
 * numbers below fifty that can be expressed in such a way:
 *
 * 28 = 2^2 + 2^3 + 2^4
 * 33 = 3^2 + 2^3 + 2^4
 * 49 = 5^2 + 2^3 + 2^4
 * 47 = 2^2 + 3^3 + 2^4
 * How many numbers below fifty million can be expressed as the sum of a
 * prime square, prime cube, and prime fourth power?
 */

int
main()
{
    double max = 50000000;
    max = 50;
    double out;
    double i, j, k;

    for(i = 2; i <= max; i++)
    {
        for(j = 2; i <= max; i++)
        {
            for(k = 2; i <= max; i++)
            {
                out = pow(i, 2) + pow(j, 3) + pow(k, 4);
                printf("%0.f\n", out);
            }
        }
    }

    return 0;
}
