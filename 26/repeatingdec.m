function [ period ] = repeatingdec( input )
% Asking for the repetend length of a fraction with denominator d 
% amounts to asking for the smallest power of 10 whose remainder, 
% when divided by d, is 1.


period = 0;
p = input - 1;
if( ((10^p) - 1)/ input == floor( ((10^p) - 1)/ input))
    period = ((10^p) - 1)/ input;
end

