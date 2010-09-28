#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 36
#
# The decimal number, 585 = 1001001001 (binary), is palindromic in both
# bases.
#
# Find the sum of all numbers, less than one million, which are
# palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not
# include leading zeros.)
#

def is_palindrome?(n)
    return true if n.to_s == n.to_s.reverse && n.to_s(2) == n.to_s(2).reverse
    false
end

sum = 0
0.upto 1000000 do |i|
    sum += i if is_palindrome?(i)
end
puts "Sum = #{sum}"
