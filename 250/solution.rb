#!/usr/bin/env ruby
#
# projecteuler.net
# problem 250
#
# Find the number of non-empty subsets of {1^1, 2^2, 3^3,...,
# 250250^250250}, the sum of whose elements is divisible by 250. Enter
# the rightmost 16 digits as your answer.
#
require 'prime'
require 'ruby-progressbar'
require 'gmp'

max = 250250
#powers = (1..max).to_a.map{|x| GMP::Z.pow(x, x)}
numbers = (1..max).to_a

count = 0

1.upto(max) do |i|
    numbers.combination(i).map{|x| x.map{|y| GMP::Z.pow(y, y)}.inject(:+)}.map{|x| count += 1 if x % 250 == 0}
end
puts
puts count
