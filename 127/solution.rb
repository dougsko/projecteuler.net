#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 127
#

require '../tools/ffi_pe'
require 'prime'
require 'ruby-progressbar'
require 'parallel'
require 'gmp'

include PEMethods

def rad(num)
    Prime.prime_division(num).transpose.first.inject(:*)
end

def abc_hit(a, b, c)
    #if a.gcd(b) == a.gcd(c) and a.gcd(c) == b.gcd(c) and b.gcd(c) == 1
    if gcd(a, b) == gcd(a, c) and gcd(a, c) == gcd(b, c) and gcd(b, c) == 1
        if rad(a*b*c) < c
            puts "#{a}, #{b}, #{c}"
            return true
        end
    end
    false
end

sum = 0
hits = 0
start = 1
max = 120000

(start..max).to_a.permutation(3).lazy.select{|x| x[0] < x[1] and x[0] + x[1] == x[2] and abc_hit(x[0], x[1], x[2])}.each do |x|
    sum += x[2] and hits += 1
end

puts "The number of hits is #{hits}" 
puts "The cumulative sum of c is #{sum}"

