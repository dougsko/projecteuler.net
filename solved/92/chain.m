function [ out ] = chain(in)
	while (in ~= 89) & (in ~= 1)
		in = add_squares(in);
	end
	out = in;
end
