k = 1:5;
p = primes(10^2);
p = p(p >= 5);
[i, j] = meshgrid(p, k);
sum(mod(sum(factorial((i - j))),p))
