function [ out, squares ] = sum_of_squares( in )
%SUM_OF_SQUARES Summary of this function goes here
%   Detailed explanation goes here

    i = 1;
    j = 1;
    s = 1:sqrt(in);
    s = s .^ 2;
    for i = 1:size(s,2)
        for j = i+1:size(s,2)
            if sum(s(i:j)) == in
                out = 1;
                squares = s(i:j);
                return
            end
        end
    end
    out = 0;
    squares = [];
end

