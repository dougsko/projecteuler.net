#!/usr/bin/env ruby
#
# projecteuler.net
# problem 191
#

a = ["L","O","A"]
count = 0
a.repeated_permutation(30).each do |x|
    string = x.join('')
    if string.match(/A{3}/) or x.count("L") > 1
        next
    else
        count += 1
    end
end
puts count
