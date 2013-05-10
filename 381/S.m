function [ out ] = S( p )
    k = 1:5;
    out = mod(sum(factorial((p-k))),p);
end

