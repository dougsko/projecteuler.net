#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 127
#
# It turns out that abc-hits are quite rare and there are only
# thirty-one abc-hits for c < 1000, with ∑c = 12523.
# For example, (5, 27, 32) is an abc-hit.
#
# Find ∑c for c < 120000.
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
    if gcd(a, b) == gcd(a, c) and gcd(a, c) == gcd(b, c) and gcd(b, c) == 1
        if rad(a*b*c) < c
            #puts "#{a}, #{b}, #{c}"
            return true
        end
    end
    false
end

def abc_hit2(a, b, c)
    if a.gcd(b) == 1 and a.gcd(c) == 1 and b.gcd(c) == 1
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
max = 200

nums = (start..max).to_a.permutation(3).lazy.map{ |x| x.map{|y| GMP::Z.new(y)} }

=begin
nums.select{|x| x[0] < x[1] and x[0] + x[1] == x[2] and abc_hit2(x[0], x[1], x[2]) }.each do |x|
    sum += x[2] and hits += 1
end
puts "The number of hits is #{hits}" 
puts "The cumulative sum of c is #{sum}"
=end


ans = []
nums.each_slice(1000000) do |slice|
    ans << Parallel.map(slice, :in_processes => 6, :progress => "working"){ |x| (x[0] < x[1] and x[0] + x[1] == x[2] and abc_hit2(x[0], x[1], x[2])) ? x[2] : 0}.reduce(:+)
end
puts ans.reduce(:+)

