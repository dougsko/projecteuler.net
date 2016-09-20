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
    attr_accessor :steps, :lines

    def initialize
        @lines = []

        File.open('small_matrix.txt') do |f|
            f.readlines.each do |line|
                @lines << line.split(',')
            end
        end
        @lines.each do |line|
            line.collect!{|x| x.to_i}
        end
        @steps = (@lines.first.size - 1) * 2
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

problem = Problem81.new
possible_solutions = []
[0,1].repeated_permutation(problem.steps) do |x| 
    if x.count(0) == problem.lines.size - 1
        possible_solutions << x
        puts "possible solution: #{x.inspect}"
    end
end

ans = []
pbar = ProgressBar.create(:title => "Solutions tried", :total => possible_solutions.size, :format => '%a %e |%b>%i| %p%% %t')
possible_solutions.each do |possible|
    ans << problem.check(possible)
    pbar.increment
end
puts ans.sort.first

