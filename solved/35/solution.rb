#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 35
#
# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
# 73, 79, and 97.
#
# How many circular primes are there below one million?
#

require '../tools/helpers.rb'

def rotate(num)
    array = num.to_s.split('')
    p = array.pop
    array = array.reverse.push p
    array.reverse.join.to_i
end

def rotations(num)
    a = []
    a << rotate(num)
    (num.to_s.size - 1).times do |i|
        a << rotate(a[i])
    end
    a
end

count = 0
p = Prime.new
prime = p.next

while prime <= 1000000
    rots = rotations(prime)
    if ! rots.collect{|rot| rot.isPrime?}.include?(false)
        count += 1
    end
    prime = p.next
end
puts count
