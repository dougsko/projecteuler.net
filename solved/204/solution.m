% A Hamming number is a positive number which has no prime factor larger than 5.
% So the first few Hamming numbers are 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15.
% There are 1105 Hamming numbers not exceeding 10^8.

% We will call a positive number a generalised Hamming number of type n, if 
% it has no prime factor larger than n.
% Hence the Hamming numbers are the generalised Hamming numbers of type 5.

% How many generalised Hamming numbers of type 100 are there which don't exceed 10^9?
% 
% solution: 2944730

max = 10^9;
ham = 100;
count = 0;

if( matlabpool('size') <= 0 )
    matlabpool local 3
end

start = tic;
parfor i = 1 : max
    if(sum(factor(i) > ham) == 0)
        count = count + 1;
    end
end
elapsed = toc(start)
count
matlabpool close
