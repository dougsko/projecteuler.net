function [ output ] = repunit( input )
%REPUNIT returns a string of ones

a = ones(1, input);
s = strtrim(cellstr(num2str(a'))');
output = strcat(s{:});