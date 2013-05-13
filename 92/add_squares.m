function [ mySum ] = add_squares(num)
    s = 0;
    while any(num > 0)
        s = s + power(mod(num, 10), 2);
        num = floor(num / 10);
    end
    mySum = s;
end
