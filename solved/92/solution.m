% 1:10^7 = 8581146
if( matlabpool('size') <= 0 )
	matlabpool local 3
end

clear
start = tic();
total = 0;
%spmd
parfor x = 1:10^7
	%x = labindex:numlabs:31;
	%x = 10^7+1:10^8;
	%x_d = codistributed(x);
	y = arrayfun(@chain, x);
	total = total + size(y(y==89), 2);
end
total
elapsed = toc(start)
