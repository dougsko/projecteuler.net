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

p = Prime.new
primes = []
primes << p.next

while primes.last < 1000 do
    primes << p.next
end

sum = 2
i = 0
j = 1
window_size = 0
longest_window = 0
biggest_prime = 0

# expand window as long as sum is prime.
# as soon as it isnt, i +=1 and j = i+1
# then keep adding 1 to j, take the sum, and check it for prime
#while i <= primes.size do #and j <= primes.size do
loop do
    primes[i..j].collect{|prime| sum += prime}
    while primes.include?(sum) do
        window_size = primes[i..j].size
        if window_size > longest_window
            longest_window = window_size
            biggest_prime = sum
            puts "#{biggest_prime} - #{longest_window}"
        end
        j += 1
    end
    i += 1
end
#puts "#{biggest_prime}"
#puts "Longest Window = #{longest_window}"
