#!/usr/bin/env ruby
#
#
# projecteuler.net
# problem 132
#
# A number consisting entirely of ones is called a repunit. We shall
# define R(k) to be a repunit of length k.
#
# For example, R(10) = 1111111111 = 11×41×271×9091, and the sum of these
# prime factors is 9414.
#
# Find the sum of the first forty prime factors of R(10^9).
#
# NOTE: repunits can be expressed like this: (10^n - 1)/9

require 'gmp'
require 'prime'

# k is a GMP::Z
def repunit(k)
    (GMP::Z.pow(10, k) - 1) / 9
end

a = GMP::Z.pow(10, 9)
r = repunit(a)
factors = Prime.prime_division(r)
sum = 0
factors[0..39].each do |f|
    sum += f.first
end
puts sum

