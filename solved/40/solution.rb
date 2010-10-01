#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 40
#
# An irrational decimal fraction is created by concatenating the positive
# integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the
# following expression.
#
# d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
#

a = []
1.upto 1000000 do |i|
    i.to_s.split('').collect{ |x| a << x.to_i }
end

puts a[1 - 1] * a[10 - 1] * a[100 - 1] * a[1000 - 1] * a[10000 - 1] * a[100000 - 1] * a[1000000 - 1]
