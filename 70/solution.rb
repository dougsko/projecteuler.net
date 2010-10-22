#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 70
#
# Euler's Totient function, phi(n) [sometimes called the phi function],
# is used to determine the number of positive numbers less than or
# equal to n which are relatively prime to n. For example, as 1, 2, 4,
# 5, 7, and 8, are all less than nine and relatively prime to nine,
# phi(9)=6.
# The number 1 is considered to be relatively prime to every positive
# number, so phi(1)=1.
#
# Interestingly, phi(87109)=79180, and it can be seen that 87109 is a
# permutation of 79180.
#
# Find the value of n, 1 <= n <= 10^7, for which phi(n) is a permutation of n
# and the ratio n/phi(n) produces a minimum.
#

require '../tools/pemethods'

include PEMethods

lowest = 2
max = 10 ** 7

2.upto(max) do |n|
    p = phi(n)
    if p.to_s.split('') == n.to_s.split('').sort
        ratio = n.to_f / p
        if ratio < lowest
            lowest = ratio
        end
        print "\nphi(#{n}) = #{p}\n"
        print "#{n}/phi(#{n}) = #{ratio}\n"
    end
    puts n if n % 100000 == 0
end
