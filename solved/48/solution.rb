#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 48
#
# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
#

a = 0
1.upto 1000 do |i|
    a += i**i
end
puts a
