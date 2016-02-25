#!/usr/bin/env ruby
#
# projecteuler.net
# problem 231
#
# The binomial coefficient 10C3 = 120.
# 120 = 2^3 × 3 × 5 = 2 × 2 × 2 × 3 × 5, and 2 + 2 + 2 + 3 + 5 = 14.
# So the sum of the terms in the prime factorisation of 10C3 is 14. 
#
# Find the sum of the terms in the prime factorisation of
# 20000000C15000000.
#
# binomial coefficient nCk can be found with:
# GMP::Z.fac(n)/(GMP::Z.fac(k)*GMP::Z.fac(n-k))
#
# apparently it's not 10998471469219
#

require 'gmp'
require 'prime'
require 'ruby-progressbar'

n = 20000000
k = 15000000

# too slow
def bcoef_slow(n, k)
    return GMP::Z.fac(n)/(GMP::Z.fac(k)*GMP::Z.fac(n-k))
end

# this should be the best option
def bcoef_faster(n, k)
    if k < 0 or k > n
        return 0
    end
    if k == 0 or k == n
        return 1
    end
    k = [k, n - k].min
    c = 1
    pbar = ProgressBar.create(:title => "Calculating binomial coefficient", :total => k, :format => '%a %e |%b>%i| %p%% %t')
    0.upto(k-1) do |i|
        c = c * (n - i) / (i + 1)
        pbar.increment
    end
    return c
end

# i think im getting rounding errors with this
def bcoef_fastest(n, k)
    a = GMP::F.new(n + 1)
    b = GMP::F.new(k + 1)
    c = GMP::F.new(n - k + 1)
    d = a.lngamma - b.lngamma - c.lngamma
    return d.exp
end

c = bcoef_faster(n, k)
puts "bcoef_faster(#{n}, #{k}) = #{c}"
primes = Prime.prime_division(c)
# [[2, 16225498], [5, 1], [97, 1], [0.10998439018121000e+14, 1]]

sum = 0
primes.each do |x|
    sum += x.inject(:*)
end
puts "The sum of the terms in the prime factorisation = #{sum}" 
