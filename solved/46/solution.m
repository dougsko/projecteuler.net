max = 10000;
all = 1:max;
all_odds = all(1:2:length(all));
all_composites = all_odds(~isprime(all_odds));
p = primes(10000);
m = 1:max;
s = m .^ 2;
t = s .* 2;
results = bsxfun(@plus, t, p.');
composite_results = results(~isprime(results));
setdiff(all_composites, composite_results)




