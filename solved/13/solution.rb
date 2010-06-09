#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 13
#
require 'yaml'

sum = 0
first_10 = ""
numbers = YAML.load_file('numbers.yml')

numbers.each do |num|
    sum += num.to_i
end

0.upto 9 do |i|
    first_10 += sum.to_s.split('')[i]

end
puts first_10 

