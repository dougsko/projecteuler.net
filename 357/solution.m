x = 1;
foo = [];
start = tic();
while(x < 10^5)
    d = divisors(x);
    if all(isprime(d + x ./ d)) == 1
        %disp(x)
        foo(end+1) = x;
    end
    x = x + 1;
end
elepsed = toc(start)
sum(foo)
    
