% answer = 1739023853137
%
%matlabpool open local 3
parpool('local', 6);
%myCluster = parcluster('local')
%delete(myCluster.Jobs)
sum = 0;
start = tic();
parfor x = 1:100000000
    d = divisor_old(x);
    if all(isprime(d + x ./ d)) == 1
        sum = sum + x;
    end
end
elapsed = toc(start)
sum
    
%matlabpool close
