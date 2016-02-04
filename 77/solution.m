%
% projecteuler.net 
% problem 77

% It is possible to write ten as the sum of primes in exactly five different ways:
%
% 7 + 3
% 5 + 5
% 5 + 3 + 2
% 3 + 3 + 2 + 2
% 2 + 2 + 2 + 2 + 2
%
% What is the first value which can be written as the sum of primes in over five thousand different ways?

% let n = 10
% primes(n)
% 2     3     5     7
% 2a + 3b + 5c + 7d
% where a, b, c, d = any integer from say, 0-100
% if expression equals n, count += 1
%

a = 0:10;

parfor x=1:20
    p = primes(x);
    perms = npermutek(a, size(p,2));
    count = 0;
    for y=1:size(perms, 1)
        if(sum(perms(y,:) .* p) == x)
            count = count + 1;
            if(count == 5000)
                sprintf('The answer is %d', x)
                break
            end
        end
    end
    sprintf('%d has a count of %d', x, count)
end
