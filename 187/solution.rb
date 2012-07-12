#!/usr/bin/env ruby
#
# prijecteuler.net
# problem 187
#
# A composite is a number containing at least two prime factors. For
# example, 15 = 3 * 5; 9 = 3 * 3; 12 = 2 * 2 * 3.
#
# There are ten composites below thirty containing precisely two, not
# necessarily distinct, prime factors: 4, 6, 9, 10, 14, 15, 21, 22, 25,
# 26.
#
# How many composite integers, n < 10^8, have precisely two, not
# necessarily distinct, prime factors?
#

count = 0
2.upto(10**8) do |i|
    count += 1 if `factor #{i}`.split(":")[1].split(" ").size == 2
end
puts count

