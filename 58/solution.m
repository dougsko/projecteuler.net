i = 5023;
%ratios = arrayfun(@(x) primeratio(x), i);
%foo = i(ratios < 10);
%foo(1)

while(primeratio(i) >= 10)
    i = i + 2;
end
i
primeratio(i)
