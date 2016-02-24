#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 127
#

require '../tools/ffi_pe'
require 'prime'
require 'ruby-progressbar'

include PEMethods

def rad(num)
    Prime.prime_division(num).map{|x| x.first}.inject(1){|p, x| p * x}
end

def abc_hit(a, b, c)
    if gcd(a, b) == gcd(a, c) and gcd(a, c) == gcd(b, c) and gcd(b, c) == 1
        if a < b
            if a + b == c
                if rad(a*b*c) < c
                    #puts "#{a}, #{b}, #{c}"
                    return true
                end
            end
        end
    end
    false
end

#puts abc_hit(5, 27, 32)

sum = 0
max = 120000
pbar = ProgressBar.create(:title => "Integers checked", :total => 1000, :format => '%a %e |%b>%i| %p%% %t')
1.upto max do |a|
    1.upto max do |b|
        1.upto max do |c|
            sum += c if abc_hit(a, b, c)
        end
    end
    pbar.increment
end
puts "The cumulative sum of c is #{sum}"
