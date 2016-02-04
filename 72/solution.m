mymax = 10^6;
count = 0;

parfor i=2:mymax
    for j=1:i-1
        if(gcd(i, j) == 1)
            count = count + 1;
        end
    end
end
count
