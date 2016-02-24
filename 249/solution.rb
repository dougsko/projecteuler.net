#!/usr/bin/env ruby
#
# projecteuler.net
# problem 249
#
# Let S = {2, 3, 5, ..., 4999} be the set of prime numbers less than
# 5000.
#
# Find the number of subsets of S, the sum of whose elements is a prime
# number.
# Enter the rightmost 16 digits as your answer.
#
require 'prime'
require 'ruby-progressbar'

max = 5000
primes = Prime.each(max).to_a

count = 0

1.upto(max) do |i|
    primes.combination(i).to_a.map{|x| x.inject(:+)}.each{|y| count += 1 if Prime.prime?(y)}
end
puts
puts count
