min = 1;
max = 10^6;
%min = 20;
%max = 100;
count = 0;
while count ~= 3
    i = min:max;
    count = arrayfun(@cubic_perm, i);
    min = min + 10^4 + 1;
    max = max + 10^4;
end
sort(i(count==3))

