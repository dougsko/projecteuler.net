function [ count ] = hamming( max, ham )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
count = 0;
a = 1 : max;
for i = a
    if(sum(factor(i) > ham) == 0)
        count = count + 1;
    end
end
end




