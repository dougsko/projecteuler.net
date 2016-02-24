#!/usr/bin/env ruby
#
# projecteuler.net
# problem 211
#
# For a positive integer n, let σ2(n) be the sum of the squares of its
# divisors. For example,
#
# σ2(10) = 1 + 4 + 25 + 100 = 130.
# Find the sum of all n, 0 < n < 64,000,000 such that σ2(n) is a perfect
# square.
#
# answer: 1922364685

require 'gmp'
require 'ruby-progressbar'
require 'prime'

class Integer
    def proper_divisors
        return [1] if self == 1
        primes = prime_division.flat_map{|prime, freq| [prime] * freq}
        (1...primes.size).each_with_object([1]) do |n, res|
            primes.combination(n).map{|combi| res << combi.inject(:*)}
        end.flatten.uniq.push(self)
    end
end

sum = 0
max = 64000000
pbar = ProgressBar.create(:title => "Integers checked", :total => max, :format => '%a %e |%b>%i| %p%% %t')
1.upto(max) do |n|
    sum += n if GMP::Z(n.proper_divisors.map{|x| x**2}.inject(:+)).square?
    pbar.increment
end
puts sum

