function [ ratio ] = primeratio( i )
%PRIMERATIO Summary of this function goes here
%   Detailed explanation goes here

n = spiral(i);
a = diag(n);
b = diag(flipud(n));
%c = unique([a;b]);
c = [a;b];
ratio = ceil(size(c(isprime(c)),1) / (size(c,1)-1) * 100);
end

