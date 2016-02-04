#!/usr/bin/env ruby
# proejcteuler.net
# problem 76
#
# It is possible to write five as a sum in exactly six different ways:
#
# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1
#
# How many different ways can one hundred be written as a sum of at
# least two positive integers?
#

sum = 0
solutions = []
possible = []
0.upto(99) do |i|
    possible << i
end
possible.repeated_permutation(100).to_a.each do |foo|
    if (foo.inject { |sum, x| sum + x }) == 100
        if ! solutions.include?(foo.sort)
            solutions << foo.sort
            puts foo.inspect
            sum += 1
        end
    end
end
puts sum
