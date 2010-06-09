#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 16
#
# SUm of digits of 2^1000
#

require 'rubygems'
require 'bigdecimal'

sum = 0
num = BigDecimal("2") ** 1000
num_arr = num.to_s('1F').split(' ')
num_arr.each do |num|
    sum += num.to_i
end
puts sum.to_s


