#!/usr/bin/env ruby
#
# projecteuler.net
# problem 429
#
# A unitary divisor d of a number n is a divisor of n that has the
# property gcd(d, n/d) = 1.
# The unitary divisors of 4! = 24 are 1, 3, 8 and 24.
# The sum of their squares is 1^2 + 3^2 + 8^2 + 24^2 = 650.
#
# Let S(n) represent the sum of the squares of the unitary divisors of
# n. Thus S(4!)=650.
#
# Find S(100 000 000!) modulo 1 000 000 009.
#

require '../tools/ffi_pe'
require 'gmp'

include PEMethods

def s(n)
    divisors2(n).map{|x| GMP::Z.new(x.to_s)}.select{|x| y = n / x; z = GMP::Z.new(y.to_s); x.gcd(z) == 1}.map{|x| x**2}.reduce(:+)
end

n = GMP::Z.fac(100000000)

puts s(n) % 1000000009

