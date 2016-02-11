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

# k is a GMP::Z
def repunit(k)
    (GMP::Z.pow(10, k) - 1) / 9
end

a = ""
(10**9).times do 
    a += "1"
end
b = GMP::Z.new(a)
puts b.to_s
exit

a = GMP::Z.pow(10, 9)
r = repunit(a)

z = GMP::Z.new(r.to_s)
puts z.sizeinbase(10)

