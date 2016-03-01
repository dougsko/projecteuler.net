function [ out ] = divisors( in )
%DIVISORS Summary of this function goes here
%   Detailed explanation goes here
	out = [];

    N = in;
    %x = gpuArray(1:N);
	x = 1:N;
	out = x(~(rem(N, x)));
end

