#!/usr/bin/env ruby
#
# projecteuler.net
# problem 381
#
# For a prime p let S(p) = (∑(p-k)!) mod(p) for 1 ≤ k ≤ 5.
#
# For example, if p=7,
# (7-1)! + (7-2)! + (7-3)! + (7-4)! + (7-5)! = 6! + 5! + 4! + 3! + 2! =
# 720+120+24+6+2 = 872.
# As 872 mod(7) = 4, S(7) = 4.
#
# It can be verified that ∑S(p) = 480 for 5 ≤ p < 100.
#
# Find ∑S(p) for 5 ≤ p < 10^8.
#

require 'gmp'
require 'prime'
require 'parallel'

def s(p)
    ((1..5).map{|k| GMP::Z.fac(p-k)}.reduce(:+) % p).to_i
end


primes = Prime.each(10**8).select{|p| p >= 5}

puts Parallel.map(primes, :in_processes => 6, :progress => "Working"){|p| s(p)}.reduce(:+)


