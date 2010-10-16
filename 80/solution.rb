#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 80
#
# It is well known that if the square root of a natural number is not an
# integer, then it is irrational. The decimal expansion of such square
# roots is infinite without any repeating pattern at all.
#
# The square root of two is 1.41421356237309504880..., and the digital
# sum of the first one hundred decimal digits is 475.
#
# For the first one hundred natural numbers, find the total of the
# digital sums of the first one hundred decimal digits for all the
# irrational square roots.
#

require 'bigdecimal'

sum = 0

1.upto 100 do |i|
    whole = 0
    dec = 0
    
    i = 25
    whole, dec = BigDecimal.new(i.to_s).sqrt(100).to_s('F').split('.')
    array = (whole + dec).split('')
    
    if array != ['0']
        array[0..99].collect{ |j| sum += j.to_i}
    end
    puts whole
    puts dec
    exit
end
puts sum
