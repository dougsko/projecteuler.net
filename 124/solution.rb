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

n_rad_n = {}

1.upto(10) do |n|
    n_rad_n[n] = rad(n)
end

puts n_rad_n.inspect

n_a = []
rad_n = []

# need a way to sort by a[1], then a[0]
n_rad_n.sort{|a,b| a[1]<=>b[1]}.each { |elem|
    puts "#{elem[0]}, #{elem[1]}"
}

