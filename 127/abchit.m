function [ output ] = abchit( a, b, c )
%ABCHIT 
% 1. GCD(a, b) = GCD(a, c) = GCD(b, c) = 1
% 2. a < b
% 3. a + b = c
% 4. rad(abc) < c

output = false;
if gcd(a, b) == 1 && gcd(a, c) == 1 && gcd(b, c) == 1 && a < b == 1 && a + b == c && rad(a*b*c) < c == 1
    output = true;
end

end

