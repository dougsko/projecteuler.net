function [ output ] = s( n, m )
%S Summary of this function goes here
%   Detailed explanation goes here

p = n^15;
p1 = p + 1;
factors = unique(factor(p1));
output = sum(factors(factors < m));

end

