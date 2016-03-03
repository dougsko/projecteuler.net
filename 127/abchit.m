function [ output ] = abchit( a, b, c )
% We shall define the triplet of positive integers (a, b, c) to be an
% abc-hit if:
% 1. GCD(a, b) = GCD(a, c) = GCD(b, c) = 1
% 2. a < b
% 3. a + b = c
% 4. rad(abc) < c

if gcd(a, b) == 1 && gcd(a, c) == 1 && gcd(b, c) == 1 && a < b && a + b == c && rad(a*b*c) < c
    output = 1;
else
    output = 0;
end


end

