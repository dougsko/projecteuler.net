#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 34
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the
# factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
#

def fact(n)
    accu = 1
    1.upto n do |i|
        accu *= i
    end
    accu
end

total = 0

3.upto 1000000 do |i|
    sum = 0
    array = i.to_s.split('')
    array.collect{ |x| sum += fact(x.to_i) }
    if i == sum
        total += i
        puts "#{i}: #{sum}"
    end
end
puts "total = #{total}"
