% 
%#!/usr/bin/env ruby
%#
%# projecteuler.net
%#
%# problem 119
%#
%# he number 512 is interesting because it is equal to the sum of its
%# digits raised to some power: 5 + 1 + 2 = 8, and 8^3 = 512. Another
%# example of a number with this property is 615656 = 28^5.
%#
%# We shall define an to be the nth term of this sequence and insist that
%# a number must contain at least two digits to have a sum.
%#
%# You are given that a2 = 512 and a10 = 615656.
%#
%# Find a30.
%#
min = sym(11);
max = sym(min + 10^5);
start = tic();
while(true)
	[i, j] = meshgrid(min:max, 1:50);
	if size(i, 1) > 0
		%i_gpu = gpuArray(i(1,:));
        i_gpu = i;
		temp_sums = add_digits(i_gpu(1,:));
		sums = repmat(temp_sums,[size(j,1) 1]);
		powers = sums .^ j;
		disp(powers(powers==i))
		min = min + 10^4 + 1;
		max = max + 10^4;
	else
		min
		max
		break
	end
end
elapsed = toc(start)
