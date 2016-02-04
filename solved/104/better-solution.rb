#!/usr/bin/env ruby
#
# projecteuler.net
# problem 104
#
# The Fibonacci sequence is defined by the recurrence relation:
#
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#
# It turns out that F541, which contains 113 digits, is the first
# Fibonacci number for which the last nine digits are 1-9 pandigital
# (contain all the digits 1 to 9, but not necessarily in order). And
# F2749, which contains 575 digits, is the first Fibonacci number for
# which the first nine digits are 1-9 pandigital.
#
# Given that Fk is the first Fibonacci number for which the first nine
# digits AND the last nine digits are 1-9 pandigital, find k.
#

require '../tools/ffi_pe'

include PEMethods

begin
   (1..1000000).each do |i|
        x = fib(i)
        x_size = x.size
        if(x_size > 8)
            first_nine = x[0..8]
            last_nine = x[x_size-9..x_size-1]
            if(is_one_nine_pandigital(first_nine) && is_one_nine_pandigital(last_nine))
                puts i
                exit
            end
        end
   end
rescue Interrupt
    puts
    puts "ending on i = " + i.to_s
end
