#!/usr/bin/env ruby
#
# projecteuler.net
# problem 294
#
# For a positive integer k, define d(k) as the sum of the digits of k in
# its usual decimal representation. Thus d(42) = 4+2 = 6.
#
# For a positive integer n, define S(n) as the number of positive
# integers k < 10^n with the following properties :
#
# k is divisible by 23 and
# d(k) = 23.
# You are given that S(9) = 263626 and S(42) = 6377168878570056.
# Find S(11^12) and give your answer mod 10^9.
#

require 'gmp'
require 'ruby-progressbar'
require 'parallel'

def d(n)
    n.to_s.chars.map(&:to_i).reduce(:+)
end

def divisible?(n)
    return true if n % 23 == 0
    return false
end

@count = 0
def inc
    @count += 1
end

def s(n)
    count = 0
    max = GMP::Z.pow(10, n)
    #max = 10**n
    #1.upto(max) do |k|
    Parallel.map((1..max), :in_processes => 6, :progress => "Working"){|k| (divisible?(k) and d(k) == 23) ? 1 : 0}.reduce(:+)
end

#puts s(6)

puts s(11**12) % 10**9
