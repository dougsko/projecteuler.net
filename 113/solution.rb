#!/usr/bin/env ruby
#
# projecteuler.net problem 113
#
# Working from left-to-right if no digit is exceeded by the digit to its
# left it is called an increasing number; for example, 134468.
#
# Similarly if no digit is exceeded by the digit to its right it is
# called a decreasing number; for example, 66420.
#
# We shall call a positive integer that is neither increasing nor
# decreasing a "bouncy" number; for example, 155349.
#
# As n increases, the proportion of bouncy numbers below n increases
# such that there are only 12951 numbers below one-million that are not
# bouncy and only 277032 non-bouncy numbers below 10^10.
#
# How many numbers below a googol (10^100) are not bouncy?

require '../tools/ffi_pe.rb'

include PEMethods

count = 0
upper = 10**10
1.upto(upper - 1) do |i|
    if(! is_bouncy(i.to_s))
        count += 1
    end
end
puts count