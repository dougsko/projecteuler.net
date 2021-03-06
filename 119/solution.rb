#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 119
#
# he number 512 is interesting because it is equal to the sum of its
# digits raised to some power: 5 + 1 + 2 = 8, and 8^3 = 512. Another
# example of a number with this property is 614656 = 28^4.
#
# We shall define an to be the nth term of this sequence and insist that
# a number must contain at least two digits to have a sum.
#
# You are given that a2 = 512 and a10 = 614656.
#
# Find a30.
#

require '../tools/ffi_pe'

include PEMethods

special = []
i = 11
while special.size < 30 do
	sum = add_digits(i)
	1.upto(100) do |j|
		pow = sum ** j
		break if pow > i
		if pow == i
			special << i
			puts i
		end
	end
	i += 1
end
puts special[29]
