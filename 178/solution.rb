#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 178
#
# Consider the number 45656. 
# It can be seen that each pair of consecutive digits of 45656 has a
# difference of one.
# A number for which every pair of consecutive digits has a difference
# of one is called a step number.
# A pandigital number contains every decimal digit from 0 to 9 at least
# once.
# How many pandigital step numbers less than 10^40 are there?
#

require '../tools/ffi_pe'

include PEMethods

count = 0
max = 10**40
1000000000.upto(max) do |i|
    n = i.to_s
    count += 1 if is_step(n) and is_pandigital(n)
end
puts count
        


    
