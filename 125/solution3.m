start = tic;
%% get all the palindromes first
max = 10^5;
p = [];
a = 1:max;
%a = num2cell(1:max);
a = arrayfun(@(x) num2str(x), a, 'UniformOutput' ,false);
b = cellfun(@(x) fliplr(x), a, 'UniformOutput', false );
for i = 1:max
    if(strcmp(a(i), b(i)))
        p(end+1) = str2num(a{i});
    end
end

%% find sum of squares
my_sum = 0;
for i = 1:size(p,2)
    if(sum_of_squares(p(i)))
        my_sum = my_sum + p(i);
    end
end
my_sum
elapsed = toc(start)