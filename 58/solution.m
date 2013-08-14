%i = 17517;
%ratios = arrayfun(@(x) primeratio(x), i);
%foo = i(ratios < 10);
%foo(1)

%%
%{
while(primeratio(i) >= 10)
    i = i + 2;
end
i
primeratio(i)
%}

%%
parfor i = 17525:30001
    if(mod(i, 2) ~= 0)
        r = primeratio(i);
        if(r < 10)
            i
            r
        end
    end
end
        
