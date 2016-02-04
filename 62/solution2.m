% projecteuler.net
% problem 62
%
% The cube, 41063625 (345^3), can be permuted to produce two other cubes:
% 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest
% cube which has exactly three permutations of its digits which are also
% cube.
%
% Find the smallest cube for which exactly five permutations of its digits
% are cube.

min = 1;
max = 1000;

i = min:max;
cubes = i .^ 3;

sorted = sort(dec2base(cubes, 10) - '0', 2);
perms = str2num(num2str(sorted, '%i'));
uniq = unique(perms);
count = hist(perms, uniq);
cubes(count == 3)

