#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 145
#
# Some positive integers n have the property that the sum [ n +
# reverse(n) ] consists entirely of odd (decimal) digits. For instance,
# 36 + 63 = 99 and 409 + 904 = 1313. We will call such numbers
# reversible; so 36, 63, 409, and 904 are reversible. Leading zeroes are
# not allowed in either n or reverse(n).
#
# There are 120 reversible numbers below one-thousand.
#
# How many reversible numbers are there below one-billion (10^9)?
#

def reversible(n)
    return false if n.to_s.split('').last.to_i == 0
    sum = n + n.to_s.reverse.to_i
    sum.to_s.split('').each do |digit|
        return false if digit.to_i % 2 == 0
    end
    return true
end

count = 0
1.upto(10**9) do |i|
    count += 1 if reversible(i)
end

puts count
