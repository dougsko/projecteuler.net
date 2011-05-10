#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 127
#

require '../tools/ffi_pe'

include PEMethods
def rad(num)
    res = 1
    `factor #{num}`.chomp.split(':')[1].split(' ').uniq.each do |x|
        res *= x.to_i
    end
    res
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
1.upto 1000 do |a|
    1.upto 1000 do |b|
        1.upto 1000 do |c|
            sum += 1 if abc_hit(a, b, c)
        end
    end
end
puts sum
