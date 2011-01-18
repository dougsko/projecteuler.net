#!/usr/bin/env ruby
#
# projecteuler.net problem 113
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
# As n increases, the proportion of bouncy numbers below n increases
# such that there are only 12951 numbers below one-million that are not
# bouncy and only 277032 non-bouncy numbers below 1010.
#
# How many numbers below a googol (10^100) are not bouncy?

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

def bouncy2?(num)
    i = 0
    a = num.to_s.split('')
    foo = a[i].to_i - a[i+1].to_i
    1.upto(a.size - 2) do |i|
        if( (a[i].to_i - a[i+1].to_i) != foo)
            return true
        else
            return false
        end
    end
end
        

count = 0
upper = (1000000) - 1
1.upto(upper) do |i|
    if(bouncy2?(i))
        count += 1
    end
end
puts count
