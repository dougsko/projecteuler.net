#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 63
#
# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the
# 9-digit number, 134217728=8^9, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?
#

count = 0
1.upto(9) do |n|
    count += (1 / (1 - Math::log10(n))).to_i
end
puts count
