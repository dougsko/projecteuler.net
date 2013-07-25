if( matlabpool('size') <= 0 )
        matlabpool local 3
end

clear
answer = 0;
max = 1:10^8;
max=reshape(max,500000,[]);
mySum = 0; %zeros(1, max);
myCount = 0; %zeros(1, max);
myStrings = {};

start = tic();
parfor i = 1:size(max, 1);
    myStrings = arrayfun(@num2str, max(i,:), 'UniformOutput', false);
    pals = max(i, cellfun(@(x) isequal(x, fliplr(x)), myStrings));
    sos = arrayfun(@sum_of_squares, pals);
    mySum = mySum + sum(pals(sos==1));
    myCount = myCount + size(sos(sos==1),2);
end
mySum
myCount

elapsed = toc(start)

