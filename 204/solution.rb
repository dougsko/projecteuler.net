#!/usr/bin/env ruby
#
# projecteuler.net
# problem 204
#

count = 0
1.upto(10**8) do |i|
    factors = `factor #{i}`.split(':')[1].split(' ').uniq
    if(factors == factors.reject{|x| x.to_i > 5})
        count += 1
    end

end
puts count
