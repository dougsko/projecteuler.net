%matlabpool open local 3
sum = 0;
start = tic();
parfor x = 1:10^8
    d = divisors(x);
    if all(isprime(d + x ./ d)) == 1
        %disp(x)
        sum = sum + x;
    end
end
elepsed = toc(start)
sum
    
