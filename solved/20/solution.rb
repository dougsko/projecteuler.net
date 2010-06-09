#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 20
#
# SUm of digits of 100!
#

require 'rubygems'
require 'bigdecimal'

def fact(n)
    if n == 0
        1
    else
        n * fact(n-1)
    end
end

sum = 0
num = BigDecimal(fact(100).to_s)
num_arr = num.to_s('1F').split(' ')
num_arr.each do |num|
    sum += num.to_i
end
puts sum.to_s


