#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 69
#
# Euler's Totient function, φ(n) [sometimes called the phi function], is
# used to determine the number of numbers less than n which are
# relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all
# less than nine and relatively prime to nine, φ(9)=6.
#
# It can be seen that n=6 produces a maximum n/φ(n) for n <= 10.
#
# Find the value of n <= 1,000,000 for which n/φ(n) is a maximum.
#

require '../tools/helpers.rb'

biggest = 0
maximum = 0
ceiling = 1000000

2.upto ceiling do |n|
    phi_n = n.to_f / phi(n)
    if phi_n > biggest
        maximum = n
        biggest = phi_n
    end
end
puts "n = #{maximum} produces a max n/phi(n) for n <= #{ceiling}"
puts "Maximum = #{biggest}"
