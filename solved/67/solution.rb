#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 67
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

(triangle.size - 2).downto(0) do |row|
    0.upto(row) do |col|
        if triangle[row + 1][col] > triangle[row + 1][col + 1]
            triangle[row][col] += triangle[row + 1][col]
        else
            triangle[row][col] += triangle[row + 1][col + 1]
        end
    end
    puts
end

puts triangle[0][0]
