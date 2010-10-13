#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 41
#
# We shall say that an n-digit number is pandigital if it makes use of
# all the digits 1 to n exactly once. For example, 2143 is a 4-digit
# pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
#
require '../tools/helpers.rb'

p = Prime.new

def pandigital?(num)
    compare = []
    num_a = num.to_s.split('').collect{|x| x.to_i}.sort
    num_a.first.upto num_a.size do |i|
        compare << i
    end
    return true if num_a == compare
    false
end

biggest = 0
prime = p.next
loop do
    if pandigital?(prime)
        biggest = prime
        puts biggest
    end
    prime = p.next
end


