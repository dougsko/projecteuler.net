% gives the answer of 1139575, which is wrong.
%

if( matlabpool('size') <= 0 )
<<<<<<< HEAD
    matlabpool local 8
=======
    matlabpool local 4
>>>>>>> 53f85f9b1d98fd0b5664907915a242392fbc859d
end



p = primes(50000000);
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
