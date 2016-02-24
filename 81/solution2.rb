#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 81
#
# The solution for small_matrix.txt is 2427.
#

require 'ruby-progressbar'
require 'pp'

class Problem81
    def initialize
        @lines = []

        File.open('matrix.txt') do |f|
            f.readlines.each do |line|
                @lines << line.split(',')
            end
        end
        @lines.each do |line|
            line.collect!{|x| x.to_i}
        end
    end

    def check(possible)
        i = 0
        j = 0
        sum = 0
        sum += @lines[i][j]
        #puts "sum = #{sum}"
        possible.each do |k|
            if k == 0 # go down
                i += 1
            elsif k == 1 # go right
                j += 1
            end
            #puts "#{sum} + #{@lines[i][j]} = #{sum + @lines[i][j]}"
            sum += @lines[i][j]
        end
        #puts "#{possible.inspect} = #{sum}"
        return sum
    end
end

possible_solutions = []
[0,1].repeated_permutation(158) do |x| 
    if x.count(0) == 79
        possible_solutions << x
        puts "possible solution: #{x.inspect}"
    end
end

ans = []
problem = Problem81.new
pbar = ProgressBar.create(:title => "Solutions tried", :total => possible_solutions.size, :format => '%a %e |%b>%i| %p%% %t')
possible_solutions.each do |possible|
    ans << problem.check(possible)
    pbar.increment
end
puts ans.sort.first

