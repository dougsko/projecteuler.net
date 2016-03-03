#!/usr/bin/env ruby
#
# projecteuler.net
# problem 346
#
# The number 7 is special, because 7 is 111 written in base 2, and 11
# written in base 6 
# (i.e. 7b10 = 11b6 = 111b2). In other words, 7 is a repunit in at least
# two bases b > 1.
#
# We shall call a positive integer with this property a strong repunit.
# It can be verified that there are 8 strong repunits below 50:
# {1,7,13,15,21,31,40,43}. 
# Furthermore, the sum of all strong repunits below 1000 equals 15864.
#
# Find the sum of all strong repunits below 10^12.
#
# GMP only allows a base up to 62, which is limiting the solution.
#

require 'gmp'

# m = number
# n = base
def convert(m, n)
    stack = []
    while(m >= n)
        stack.push((m % n).to_s)
        m = m / n
    end
    str = m.to_s
    stack.each do |i|
        str << i
    end
    str
end



sum = 0
count = 0
1.upto(50).each do |i|
    count = 0
    n = GMP::Z.new(i)
    2.upto(36) do |j|
        break if count == 2
        if n.to_s(j).split('').all?{|x| x == '1'}
            count += 1
            puts "#{i} - convert(#{i}, #{j}) = #{convert(i, j)}, count = #{count}"
            sum += i
        end
    end
end
puts "sum = #{sum}"


