#!/usr/bin/env ruby
#
# projecteuler.net
# problem 171
#
# For a positive integer n, let f(n) be the sum of the squares of the
# digits (in base 10) of n, e.g.
#
# f(3) = 3^2 = 9,
# f(25) = 2^2 + 5^2 = 4 + 25 = 29,
# f(442) = 4^2 + 4^2 + 2^2 = 16 + 16 + 4 = 36
#
# Find the last nine digits of the sum of all n, 0 < n < 10^20, such that
# f(n) is a perfect square.
#

require 'ruby-progressbar'

def f(n)
    n.to_s.chars.map{ |x| x.to_i**2 }.reduce(:+)
end

def fast_f(n)
    t = n
    sum = 0
    while t != 0
        rem = t % 10
        sum += rem ** 2
        t /= 10
    end
    return sum
end

sum = 0

pbar = ProgressBar.create(:format => '%a %e |%b>%i| %p%% %t', :total => 10**20)
0.upto(10**20) do |n|
    y = fast_f(n)
    if Math.sqrt(y) % 1 == 0
        sum += n
    end
    pbar.increment
end
puts
puts sum
