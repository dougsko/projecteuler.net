#!/usr/bin/env ruby
#
# projecteuler.net
# problem 206
#
# Find the unique positive integer whose square has the form
# 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

require 'ruby-progressbar'

min = 1000000000
max = 10000000000

pbar = ProgressBar.create(:title => "Squares checked", :total => max + 1, :format => '%a %e |%b>%i| %p%% %t')
min.upto(max) do |n|
    if (n * n).to_s.chars.select.with_index { |_, i| i.even? } == ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        puts
        puts "n = #{n}"
    end
    pbar.increment
end


