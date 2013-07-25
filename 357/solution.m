%matlabpool open local 3
sum = 0;
start = tic();
parfor x = 1:10^6
    d = divisor(x);
    if all(isprime(d + x ./ d)) == 1
        sum = sum + x;
    end
end
elepsed = toc(start)
sum
    
%matlabpool close
