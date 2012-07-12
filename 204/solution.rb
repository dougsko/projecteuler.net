#!/usr/bin/env ruby
#
# projecteuler.net
# problem 204
#

count = 0
2.upto(10**8) do |i|
    if(`factor #{i}`.split(':')[1].split(' ').uniq.reject{|x| x.to_i > 5}.size != 0)
        count += 1
    end
end
puts count
