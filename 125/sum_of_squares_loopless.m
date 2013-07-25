function [ squares ] = sum_of_squares( in )
%SUM_OF_SQUARES Summary of this function goes here
%   Detailed explanation goes here

    i = 1;
    j = 1;
    s = 1:sqrt(in(end));
    s = s .^ 2;
    squares = zeros(1, size(in,2));
    for i = 1:size(s,2)
        for j = i+1:size(s,2)
            if sum(s(i:j)) == in
                disp(s(i:j))
                squares = s(i:j);
            end
        end
    end
    squares = [];
end

