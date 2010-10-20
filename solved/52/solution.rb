#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 52
#
# It can be seen that the number, 125874, and its double, 251748,
# contain exactly the same digits, but in a different order.
#
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and
# 6x, contain the same digits.
#
i = 1
loop do
    orig = i.to_s.split('').sort
    j = (2*i).to_s.split('').sort
    k = (3*i).to_s.split('').sort
    l = (4*i).to_s.split('').sort
    m = (5*i).to_s.split('').sort
    n = (6*i).to_s.split('').sort

    if orig == j and orig == k and orig == l and orig == m and orig == n
        puts i
    end
    i += 1
end
