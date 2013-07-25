function [ output ] = rad( input )
% The radical of n, rad(n), is the product of distinct prime factors of n.
% For example, 504 = 2^3 × 3^2 × 7, so rad(504) = 2 × 3 × 7 = 42.

output = prod(unique(factor(input)));


end

