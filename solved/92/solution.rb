#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 92
#
# A number chain is created by continuously adding the square of the
# digits in a number to form a new number until it has been seen before.
#
# For example,
#
# 44  32  13  10  1  1
# 85  89  145  42  20  4  16  37  58  89
#
# Therefore any chain that arrives at 1 or 89 will become stuck in an
# endless loop. What is most amazing is that EVERY starting number will
# eventually arrive at 1 or 89.
#
# How many starting numbers below ten million will arrive at 89?
#
require '../tools/ffi_pe'

count = 0

# 8581145 - no good
1.upto(10000000-1) do |j|
    i = j
    until i == 89 or i == 1 do
        sum = 0
        i.to_s.split('').collect{|x| sum += x.to_i*x.to_i}
        i = sum
        #puts i
        count += 1 if i == 89
    end
    #puts j
    if j % 100000 == 0
        puts "#{(j / 10000000.0)*100}% done..."
        puts "count = #{count}"
    end
end
puts "Final count = #{count}"


