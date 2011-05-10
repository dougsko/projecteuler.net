#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 178
#
# Consider the number 45656. 
# It can be seen that each pair of consecutive digits of 45656 has a
# difference of one.
# A number for which every pair of consecutive digits has a difference
# of one is called a step number.
# A pandigital number contains every decimal digit from 0 to 9 at least
# once.
# How many pandigital step numbers less than 10^40 are there?
#

class Integer
    def is_step?
        a = self.to_s.split('')
        (a.size - 1).times do |i|
            if (a[i].to_i - a[i+1].to_i).abs != 1
                return false
            end
        end
        return true
    end

    def is_pandigital?
        a = self.to_s.split('')
        return true if a.sort.uniq == ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return false
    end
end

count = 0
1000000000.upto(10**40) do |i|
    count += 1 if i.is_step? and i.is_pandigital?
end
puts count
        


    
