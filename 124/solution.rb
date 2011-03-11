#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 124
#
# The radical of n, rad(n), is the product of distinct prime factors of
# n. For example, 504 = 23  32  7, so rad(504) = 2  3  7 = 42.
#
# Let E(k) be the kth element in the sorted n column; for example, E(4)
# = 8 and E(6) = 9.
#
# If rad(n) is sorted for 1 <= n <= 100000, find E(10000).
#

def rad(n)
    factors = []
    p = 1

    factors = `factor #{n}`.chomp.split(" ")
    factors.delete_at(0)
    factors.uniq.collect{|x| p *= x.to_i}
    p
end

# res -> key is rad(n), value is array of n's
res = {}

1.upto(100000) do |n|
    if res[rad(n)] == nil
        res[rad(n)] = []
    end
    res[rad(n)] << n
end

res.each do |k,v|
    v.sort!
end 

#puts res.inspect
awesome = []

res.sort{|a, b| a[0] <=> b[0]}.each do |elem|
    puts "#{elem[0]} #{elem[1].inspect}"
    awesome << elem[1]
end

awesome.flatten!

puts awesome[9999]
