% this works, but factor() has a limit of 2^32
% 
function pf = problem421(n, m)
	factors = unique(factor(n^15+1))
	pf = sum(factors(find(factors < m)));
end
