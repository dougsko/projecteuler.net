#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 123
#
# Let p_n be the nth prime: 2, 3, 5, 7, 11, ..., and let r be the
# remainder when (p_n-1)^n + (p_n+1)^n is divided by p_n^2.
#
# For example, when n = 3, p_3 = 5, and 43 + 63 = 280 = 5 mod 25.
#
# The least value of n for which the remainder first exceeds 109 is
# 7037.
#
# Find the least value of n for which the remainder first exceeds 1010.
#

require "../tools/ffi_pe"

include PEMethods

def do_work(p_n)
    (((p_n - 1) ** p_n) + ((p_n + 1) ** p_n)) % (p_n ** 2)
end

def p(n)
    count = 0
    prime = "0"

    while count < n
        count +=1
        prime = next_prime(prime)
    end
    prime.to_i
end

puts p(7037)
puts do_work(p(7037))
