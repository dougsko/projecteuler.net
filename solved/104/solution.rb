#!/usr/bin/env ruby
# 
# projecteuler.net
# 
# problem 104
#
# The Fibonacci sequence is defined by the recurrence relation:
#
# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# It turns out that F541, which contains 113 digits, is the first
# Fibonacci number for which the last nine digits are 1-9 pandigital
# (contain all the digits 1 to 9, but not necessarily in order). And
# F2749, which contains 575 digits, is the first Fibonacci number for
# which the first nine digits are 1-9 pandigital.
#
# Given that Fk is the first Fibonacci number for which the first nine
# digits AND the last nine digits are 1-9 pandigital, find k.

def pandigital?(num)
    num_a = num.split('').collect{|x| x.to_i}.sort
    return true if num_a == [1, 2, 3, 4, 5, 6, 7, 8, 9]
    false
end

k = 1
a,b = 0,1
loop do
    a,b = b,a+b
    if pandigital?(a.to_s[0..8]) and pandigital?(a.to_s.reverse[0..8])
        puts k
        exit
    end
    k += 1
end
