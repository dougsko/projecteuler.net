if( matlabpool('size') <= 0 )
        matlabpool local 3
end

clear all
answer = 0;
max = 10^5;
mySum = zeros(1, max);
myCount = zeros(1, max);

start = tic();
parfor foo = 2:max;
    fooString = num2str(foo);
    if isequal(fooString, fliplr(fooString))
        if sum_of_squares(foo)
            mySum(foo) = foo;
            myCount(foo) = 1;
        end
    end
end
sum(mySum)
sum(myCount)

elapsed = toc(start)