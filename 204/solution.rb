#!/usr/bin/env ruby
#
# projecteuler.net
# problem 204
#

count = 0
1.upto(10**9) do |i|
    factors = `factor #{i}`.split(':')[1].split(' ').uniq
    if(factors == factors.reject{|x| x.to_i > 100})
        count += 1
    end

end
puts count
