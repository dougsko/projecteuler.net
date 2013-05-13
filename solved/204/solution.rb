#!/usr/bin/env ruby
#
# projecteuler.net
# problem 204
#

count = 0
max = 10**8
hamming = 5
1.upto(max) do |i|
	factors = `factor #{i}`.split(':')[1].split(' ').uniq
	if(factors == factors.reject{|x| x.to_i > hamming})
		count += 1
	end

end
puts count
