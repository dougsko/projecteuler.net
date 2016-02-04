if( matlabpool('size') <= 0 )
    matlabpool local 4
end

p = primes(90000);
squares = p .^ 2;
cubes = p .^ 3;
fourths = p .^ 4;
answer = 0;

first_two = bsxfun(@plus, squares, cubes.');
parfor i = 1:size(first_two,2)
    triplets = bsxfun(@plus, first_two(i,:), fourths.');
    answer = answer + size(triplets(triplets < 50000000),1);
end
answer