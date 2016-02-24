#!/usr/bin/env ruby
#
#
# There are some prime values, p, for which there exists a positive
# integer, n, such that the expression n3 + n2p is a perfect cube.
#
# For example, when p = 19, 8^3 + 8^2 * 19 = 12^3.
#
# What is perhaps most surprising is that for each prime with this
# property the value of n is unique, and there are only four such primes
# below one-hundred.
#
# How many primes below one million have this remarkable property?
#
# 24 is not right
#

require 'prime'
require 'ruby-progressbar'
require 'gmp'

total = 0
#primes = Prime.each(100).to_a
primes = Prime.each(1000000).to_a
pbar = ProgressBar.create(:title => "Primes checked", :total => primes.size, :format => '%a %e |%b>%i| %p%% %t')
primes.each do |prime|
    1.upto(1000000) do |n|
        x = (n**3 + n**2 * prime)
        if GMP::Z(x).rootrem(3)[1] == 0
            #puts "#{n}^3 + #{n}^2 * #{prime} = #{x} ::: #{GMP::Z(x).rootrem(3)[0]}^3"
            total += 1
            next
        end
    end
    pbar.increment
end  
puts total
