function [ out ] = divisors( in )
%DIVISORS Summary of this function goes here
%   Detailed explanation goes here

    N = in;
    x = 1:N;
    out = x(~(rem(N, x)));

end

