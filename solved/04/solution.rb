#!/usr/bin/env ruby
#
# projecteuler.net
# Solution 5
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
# A. 580085 = 995 x 583

biggest = 0
fac1 = 0
fac2 = 0

900.upto 999 do |i|
    900.upto 999 do |j|
        maybe = i*j
        if maybe.to_s == maybe.to_s.reverse
            biggest = maybe
            fac1 = i
            fac2 = j
        end
    end
    puts "#{biggest} = #{fac1} x #{fac2}"
end
puts "#{biggest} = #{fac1} x #{fac2}"
