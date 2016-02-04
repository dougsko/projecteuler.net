%min = 1;
%max = 10^4;
min = 20;
max = 1000;
count = 0;
while count ~= 3
    i = min:max;
    count = arrayfun(@cubic_perm, i);
    min = min + 1000 + 1;
    max = max + 1000;
end
sort(i(count==3))


