function [ out ] = remove_zeros( input )
%REMOVE_ZEROS Remove digits with zeros in them.
    
    out = input(~arrayfun(@(x) ismember('0', num2str(x)), input));
    
end

