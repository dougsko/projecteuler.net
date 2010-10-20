#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 56
#
# A googol (10^100) is a massive number: one followed by one-hundred
# zeros; 100^100 is almost unimaginably large: one followed by
# two-hundred zeros. Despite their size, the sum of the digits in each
# number is only 1.
#
# Considering natural numbers of the form, a^b, where a, b  100, what is
# the maximum digital sum?
#

biggest = 0

1.upto 100 do |a|
    1.upto 100 do |b|
        sum = 0
        num = a ** b
        num.to_s.split('').collect{ |x| sum += x.to_i }
        biggest = sum if sum > biggest
    end
end
puts biggest

