% 1:10^7 = 8581146
if( matlabpool('size') <= 0 )
	matlabpool local 3
end

clear
start = tic();
spmd
	%x = labindex:numlabs:31;
	x = 10^7+1:10^8;
	x_d = codistributed(x);
	y = arrayfun(@chain, x_d);
	size(y(y==89), 2)
end
elapsed = toc(start)
