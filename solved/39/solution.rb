#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 39
#
# If p is the perimeter of a right angle triangle with integral length
# sides, {a,b,c}, there are exactly three solutions for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p  1000, is the number of solutions maximised?
#

def is_pythag_triple?(a, b, c)
    return true if (a**2 + b**2) == c**2
    false
end

res = {}
1.upto(500) do |a|
    1.upto(500) do |b|
        1.upto(500) do |c|
            if is_pythag_triple?(a, b, c)
                p = a + b + c
                if res[p] == nil
                    res[p] = 1
                else
                    res[p] += 1
                end
            end
        end
    end
end
puts res.sort{|a,b| a[1]<=>b[1]}.last.inspect
