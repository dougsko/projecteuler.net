function [ out ] = chain(in)
	sum = in;
	while (sum ~= 89) & (sum ~= 1)
		sum = add_squares(sum);
	end
	out = sum;
end
