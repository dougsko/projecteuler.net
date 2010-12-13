#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 97
#
# The first known prime found to exceed one million digits was
# discovered in 1999, and is a Mersenne prime of the form 269725931; it
# contains exactly 2,098,960 digits. Subsequently other Mersenne primes,
# of the form 2p1, have been found which contain more digits.
#
# However, in 2004 there was found a massive non-Mersenne prime which
# contains 2,357,207 digits: 28433*2^7830457+1.
#
# Find the last ten digits of this prime number.
#

require 'bigdecimal'
require 'pe97'

include PE97

class Solution
    def initialize
    end

    def ruby_solution
        a = BigDecimal.new('2')
        b = a ** 7830457
        c = 28433 * b
        d = c + 1
        d_a = d.to_s('F').split('.')[0].split('')

        puts d_a[(d_a.size - 10)..d_a.size]
    end

    def c_solution
        prime = get_prime
        puts prime[(prime.size - 10)..prime.size]
    end
end

solution = Solution.new
solution.c_solution

