#!/usr/bin/env ruby
#
# projecteuler.net
# problem 348
#
# Many numbers can be expressed as the sum of a square and a cube. Some
# of them in more than one way.
#
# Consider the palindromic numbers that can be expressed as the sum of a
# square and a cube, both greater than 1, in exactly 4 different ways.
# For example, 5229225 is a palindromic number and it can be expressed
# in exactly 4 different ways:
#
# 2285^2 + 20^3
# 2223^2 + 66^3
# 1810^2 + 125^3
# 1197^2 + 156^3
#
# Find the sum of the five smallest such palindromic numbers.
#
require '../tools/ffi_pe.rb'

include PEMethods

count_h = {}
answers = []
i = 2
j = 2

=begin
while answers.length < 5 do
    2.upto(50000) do |i|
        i.upto(50000) do |j|
            sum = i*i + j*j*j
            if sum.to_s == sum.to_s.reverse
                if count_h.has_key?(sum)
                    count_h[sum] += 1
                else
                    count_h[sum] = 1
                end
                count_h.delete(sum) if count_h[sum] > 4
                if count_h[sum] == 4
                    answers << sum
                    puts "#{sum} can be found 4 ways."
                end
            end
        end
    end
end
=end

a = []
j = [[0,1],[1,0]]
2.upto(50000) do |i|
    a << i
end
a.combination(2).each do |i|
    j.each do |index|
        sum = i[index[0]]*i[index[0]] + i[index[1]]*i[index[1]]*i[index[1]]
        if sum.to_s == sum.to_s.reverse
            if count_h.has_key?(sum)
                count_h[sum] += 1
            else
                count_h[sum] = 1
            end
            count_h.delete(sum) if count_h[sum] > 4
            if count_h[sum] == 4
                answers << sum
                puts "#{sum} can be found 4 ways."
            end
        end
    end
    if answers.length == 5
        top_five = answers.sort[0..4]
        puts "SUM = #{top_five.inject(:+)}"
        break
    end
end


# tried 7841
