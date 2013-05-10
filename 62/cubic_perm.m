function [ count ] = cubic_perm( i )
%CUBIC_PERM input a number, returns number of cubes in permutions
%   Detailed explanation goes here
% 41063625 
    p_s = perms(num2str(i));
    p = str2num(p_s)';
    cubes = p(find(mod(nthroot(p, 3), 1)==0));
    count = size(unique(cubes),2); 
end

