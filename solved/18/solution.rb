#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 18
#
# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#
#    3
#   7 4
#  2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#

require 'yaml'

triangle = YAML.load_file('triangle.yml')
sum = 0
biggest_sum = 0
index = 0

100000.times do
    sum = triangle[0][0]
    index = 0
    1.upto triangle.size-1 do |i|
        if rand(2) == 0 
            sum += triangle[i][index]
        else
            index += 1
            sum += triangle[i][index]
        end
        if sum > biggest_sum
            biggest_sum = sum
        end
    end
end
puts biggest_sum

