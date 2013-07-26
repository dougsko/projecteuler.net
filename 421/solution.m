total = vpi(0);
n = vpi(1);
m = vpi(10);
m = m^8;
max = vpi(10);
max = max^3;

while n <= max
    total = total + s(n, m);
    n = n + 1;
    if mod(n,10) == 0
        n
    end
end
total


 