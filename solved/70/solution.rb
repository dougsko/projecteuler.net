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

primes = []
2001.upto(4000) do |i|
    primes << i if is_prime(i)
end

min_n = 0
min_q = 2
primes.each do |p1|
    primes.each do |p2|
        n = p1 * p2
        break if n > 10000000
        phi = (p1 - 1) * (p2 - 1)
        q = n.to_f / phi
        if(phi.to_s.split('').sort == n.to_s.split('').sort and q < min_q)
            min_q = q
            min_n = n
        end
    end
end
puts min_n
