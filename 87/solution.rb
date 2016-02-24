#!/usr/bin/env ruby
#
# projecteuler.net 87
#
#
#/* The smallest number expressible as the sum of a prime square, prime
# * cube, and prime fourth power is 28. In fact, there are exactly four
# * numbers below fifty that can be expressed in such a way:
# *
# * 28 = 2^2 + 2^3 + 2^4
# * 33 = 3^2 + 2^3 + 2^4
# * 49 = 5^2 + 2^3 + 2^4
# * 47 = 2^2 + 3^3 + 2^4
# * How many numbers below fifty million can be expressed as the sum of a
# * prime square, prime cube, and prime fourth power?
# */
#
#

require 'prime'

def get_count(n)
    ans = []
    count = 0
    primes = Prime.first(n)
    Prime.first(n).repeated_permutation(3).each {|r| ans << r[0]**2 + r[1]**3 + r[2]**4}
    puts "max = #{ans.max}"
    return ans.select{|x| x < 50000000}.count
end

# 1000 = 3933111128577841
# 1139575
#
# 1001 = 3949028090198553
# 1139575
puts get_count(2000)
