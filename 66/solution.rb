#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 66
#

res = {}
1.upto(1000) do |d|
    1.upto(10000) do |y|
        x =  Math::sqrt(1 + d*(y**2))
        if x.to_s.reverse.split('.')[0] == "0"
            if res[x] != nil
                res[x] = d
                puts "#{x}^2 - #{d}*#{y}^2 = 1"
                break
            end
        end
    end
end
sorted = []
res.sort{|a,b| b <=> a}.each do |elem|
    sorted << elem[1]
end
puts sorted[0]


