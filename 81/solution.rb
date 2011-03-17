#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 81
#
#

lines = []

File.open('matrix.txt') do |f|
    f.readlines.each do |line|
        lines << line.split(',')
    end
end
lines.each do |line|
    line.collect!{|x| x.to_i}
end

sum = lines[lines.size-1][lines.size-1]
i = lines.size - 1
j = lines.size - 1
puts sum
until i == 0 and j == 0 do
    puts "i = #{i} , j = #{j}"
    # left is smaller
    if lines[i][j-1] < lines[i-1][j] and j > 0
        j -= 1
        puts "#{sum} += #{lines[i][j]}"
        sum += lines[i][j]
    # up is smaller
    else
        i -= 1
        puts "#{sum} += #{lines[i][j]}" 
        sum += lines[i][j]
    end
end
puts sum
