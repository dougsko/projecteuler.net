#!/usr/bin/env ruby
#
#
# There are some prime values, p, for which there exists a positive
# integer, n, such that the expression n3 + n2p is a perfect cube.
#
# For example, when p = 19, 8^3 + 8^2 * 19 = 123.
#
# What is perhaps most surprising is that for each prime with this
# property the value of n is unique, and there are only four such primes
# below one-hundred.
#
# How many primes below one million have this remarkable property?
#

require 'prime'

def cube_root(x)
    Math.exp(Math.log(x.to_f)/3.to_f)
end

total = 0
primes = Prime.each(100).to_a

Prime.each(100).each do |prime|
    1.upto(5000000) do |n|
        x = (n**3 + n**2 * prime)
        if(cube_root(x) % 1 == 0)
            puts "#{n}^3 + #{n}^2 * #{prime} = #{x} ::: #{cube_root(x).to_i}^3"
            total += 1
        end
    end
end  
puts total
