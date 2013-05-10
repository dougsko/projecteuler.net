function [ mySum ] = add_digits(num)
    s = 0;
    while any(num > 0)
        s = s + mod(num, 10);
        num = floor(num / 10);
    end
    mySum = s;
end