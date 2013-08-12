%% this experimentally solves it but there's no precision
format LONG;
peter = '9d4';
colin = '6d6';

pete_wins = 0;
total = 0;

for i = 1:20000
    p = roll(peter);
    c = roll(colin);
    if(p > c)
        pete_wins = pete_wins + 1;
    end
    total = total + 1;
end
prob = pete_wins/total

%% from here down, I'm trying to get the actual answer
% this finds all the combos
p = 1:4;
c = 1:6;

p_all = allcomb(p,p,p,p,p,p,p,p,p);
c_all = allcomb(c,c,c,c,c,c);

%% this adds up the rows of each possible roll
p_sums = [];
for i = 1:size(p_all,1)
    p_sums(end+1) = sum(p_all(i,:));
end

c_sums = [];
for i = 1:size(c_all,1)
    c_sums(end+1) = sum(c_all(i,:));
end

%% this figures out how many ways each sum can be rolled
sorted_p = sort(p_sums);
sorted_c = sort(c_sums);

ways_c = [];
ways_p = [];
for i = 1:36
    i
    ways_c(end+1) = size(sorted_c(sorted_c == i), 2)
end

for i = 1:36
    i
    ways_p(end+1) = size(sorted_p(sorted_p == i), 2)
end
