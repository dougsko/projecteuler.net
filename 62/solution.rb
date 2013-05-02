#!/usr/bin/env ruby
#
# projecteuler.net
# problem 62
#
#

num = 41063600

loop do
    wins = []
    a = num.to_s.split('')
    a.permutation.each do |p|
        if(Math.cbrt(p.join('').to_i).to_s.split('.')[1] == '0')
            wins << p.join('')
        end
    end
    if wins.uniq.size == 5
        puts wins.uniq.inspect
        puts num
        exit
    else
        num += 1
    end
end
