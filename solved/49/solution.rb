#!/usr/bin/env ruby
#
## projecteuler.net
##
## problem 49
##
## The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
## increases by 3330, is unusual in two ways: (i) each of the three
#terms
## are prime, and, (ii) each of the 4-digit numbers are permutations of
## one another.
##
## There are no arithmetic sequences made up of three 1-, 2-, or 3-digit
## primes, exhibiting this property, but there is one other 4-digit
## increasing sequence.
##
## What 12-digit number do you form by concatenating the three terms in
## this sequence?
##
#

require '../tools/ffi_pe'

include PEMethods

solutions = []
four_digit_primes = []
1000.upto(9999) do |i|
        four_digit_primes << i if is_prime i
end

combos = four_digit_primes.combination(3)
while(solutions.size < 2) do
    combos.each do |combo|
        combo.sort!
        if(combo[1] - combo[0] == combo[2] - combo[1])
            if(combo[0].to_s.split('').sort == combo[1].to_s.split('').sort and combo[1].to_s.split('').sort == combo[2].to_s.split('').sort)
                solutions << combo
            end
        end
    end
end
puts solutions[1].join('')
