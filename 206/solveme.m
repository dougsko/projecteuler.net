function foo = solveme(array)
	array = gpuArray(1:20);
	squares = arrayfun(@(x)(times(x, x)), array);
	square_strings = arrayfun(@(x)(int2str(x)), squares);
	z = arrayfun(@(x)(strcmp(x(1:2:end), '14')), square_strings)
	bar = cell2mat(z);
	array(find(bar > 0))

	for square = square_strings
		if(strcmp(square(1:2:end), '14'))
			foo = i
			return
		end
	end
end
