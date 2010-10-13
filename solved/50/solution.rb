#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 50
#
# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime
# below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to
# a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most
# consecutive primes?
#
require '../tools/helpers.rb'

def sum_a(array)
    sum = 0
    array.collect{|a| sum += a}
    sum
end

p = Prime.new
primes = []
primes << p.next

while primes.last < 1000000 do
    primes << p.next
end

window_size = 0
longest_window = 0
biggest_prime = 0

0.upto(primes.size - 1) do |i|
    (i+1).upto primes.size do |j|
        sum = sum_a(primes[i..j])
        if primes.include?(sum)
            if primes[i..j].size > longest_window
                longest_window = primes[i..j].size
                biggest_prime = sum 
            end
        end
    end
end
puts "#{biggest_prime} is the sum of #{longest_window} primes"
