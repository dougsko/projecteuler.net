function [ repeat ] = repeatingdec( input )
%repeatingdec When given a fraction, returns the repeationg part of a decimal or zero if there is
%none.

for i=1:1000
    % multiply fraction by an increasing number of 9's.  if the result is
    % an integer, return it.  Otherwise, return 0.
    nines = str2double(num2str(ones(1,i)*9, '%d'));
    repeat = input * nines;
    if(mod(repeat, 1) == 0)
        return
    end
    repeat = 0;
end


end

