if( matlabpool('size') <= 0 )
	matlabpool local 3
end

min = 1;
max = 10^7;
total = 0;
start = tic();
parfor i = min:max
    d = divisors(i);
	%foo = d + i ./ d;
	%disp(foo)
    %if all(isprime(foo)) == 1
	if all(isprime(d + i ./ d)) == 1
        total = total + i;
    end
end
elepsed = toc(start)
total

matlabpool close
