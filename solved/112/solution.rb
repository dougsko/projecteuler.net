#!/usr/bin/env ruby
#
# http://projecteuler.net problem 112
#
# Working from left-to-right if no digit is exceeded by the digit to its
# left it is called an increasing number; for example, 134468.
#
# Similarly if no digit is exceeded by the digit to its right it is
# called a decreasing number; for example, 66420.
#
# We shall call a positive integer that is neither increasing nor
# decreasing a "bouncy" number; for example, 155349.
#
# Clearly there cannot be any bouncy numbers below one-hundred, but just
# over half of the numbers below one-thousand (525) are bouncy. In fact,
# the least number for which the proportion of bouncy numbers first
# reaches 50% is 538.
#
# Surprisingly, bouncy numbers become more and more common and by the
# time we reach 21780 the proportion of bouncy numbers is equal to 90%.
#
# Find the least number for which the proportion of bouncy numbers is
# exactly 99%.
#

require '../tools/ffi_pe'

def increasing?(num)
    a = num.to_s.split('')
    0.upto(a.size - 2) do |i|
        if(a[i].to_i > a[i+1].to_i)
            #puts "#{a[i]} > #{a[i+1]}"
            return false
        end
    end
    return true
end

def decreasing?(num)
    a = num.to_s.split('')
    0.upto(a.size - 2) do |i|
        if(a[i].to_i < a[i+1].to_i)
            #puts "#{a[i]} < #{a[i+1]}"
            return false
        end
    end
    return true
end

def bouncy?(num)
    if(! increasing?(num) and ! decreasing?(num))
        return true
    end
    return false
end

total = 0
bouncy_count = 0
bouncy_percent = 0
i = 0

while(bouncy_percent != 0.99) do
    i += 1
    total += 1
    if(bouncy?(i))
        bouncy_count += 1
        bouncy_percent = bouncy_count.to_f / total
    end
end
puts i
