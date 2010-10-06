#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 43
#
# The number, 1406357289, is a 0 to 9 pandigital number because it is
# made up of each of the digits 0 to 9 in some order, but it also has a
# rather interesting sub-string divisibility property.
#
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way,
# we note the following:
#
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.
#
# Sum = 16695334890

def pandigital?(num)
    num_a = num.to_s.split('').collect{|x| x.to_i}.sort
    return true if num_a == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    false
end

def generate_pd
    a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    (rand(10)+10).times do
        temp1 = a[rand(a.size)]
        temp2 = a[rand(a.size)]
        2.times do
            a[a.index(temp2)] = temp1
            a[a.index(temp1)] = temp2
        end
    end
    a.join('').to_i
end

sum = 0
solutions = []
loop do
    num = generate_pd
    if ! solutions.include?(num)
        num_a = num.to_s.split('').collect{|x| x.to_i}
        if num_a[1..3].join.to_i % 2  == 0 and
            num_a[2..4].join.to_i % 3 == 0 and
            num_a[3..5].join.to_i % 5 == 0 and
            num_a[4..6].join.to_i % 7 == 0 and
            num_a[5..7].join.to_i % 11 == 0 and
            num_a[6..8].join.to_i % 13 == 0 and
            num_a[7..9].join.to_i % 17 == 0
            
                sum += num
                puts "#{num} is pandigital"
                puts "Sum = #{sum}"
                solutions << num
        end
    end
end
