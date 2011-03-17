#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 49
#
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
# increases by 3330, is unusual in two ways: (i) each of the three terms
# are prime, and, (ii) each of the 4-digit numbers are permutations of
# one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit
# primes, exhibiting this property, but there is one other 4-digit
# increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in
# this sequence?
#

require '../tools/ffi_pe'

include PEMethods

four_digit_primes = []
1000.upto(9999) do |i|
    four_digit_primes << i if is_prime i
end

res = {}

four_digit_primes.each do |four_digit_prime|
    sorted_fdp = four_digit_prime.to_s.split('').collect!{|x| x.to_i}.sort!
    (four_digit_primes.index(four_digit_prime)+1).upto(four_digit_primes.size-1) do |j|
        if four_digit_primes[j].to_s.split('').collect!{|x| x.to_i}.sort! == sorted_fdp
            res[four_digit_prime] = [four_digit_primes[j]] if ! res[four_digit_prime]
            res[four_digit_prime] << four_digit_primes[j]
        end
    end
end

res.each do |k,v|
    v.uniq!.sort!
end

res.each do |k,v|
    if v.size >= 2
        if v[0] - k == v[1] - k
            #puts k
            #puts v
        end
    end
end

puts res[1487]

# I now just have to look at each result and see if three of the values
# have the same difference.
