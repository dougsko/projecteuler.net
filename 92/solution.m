% i get 85744333, but apparently that's wrong

if( matlabpool('size') <= 0 )
	matlabpool local 3
end

clear
total = 0;
start = tic();
parfor x = 1:10^8
	y = arrayfun(@chain, x);
	total = total + size(y(y==89), 2);
end
total
elapsed = toc(start)
