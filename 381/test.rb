#!/usr/bin/env ruby
#
#

require 'parallel'

parallel_sum = 0
parallel_res = Parallel.map((1..10), :in_processes => 2){|x| parallel_sum += x}

sum = 0
res = (1..10).map{|x| sum += x}

puts "parallel_sum = #{parallel_sum}"
puts "sum = #{sum}"

puts "parallel_res = #{parallel_res.inspect}"
puts "res = #{res.inspect}"


