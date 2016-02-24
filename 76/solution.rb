#!/usr/bin/env ruby
# proejcteuler.net
# problem 76
#
# It is possible to write five as a sum in exactly six different ways:
#
# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1
#
# How many different ways can one hundred be written as a sum of at
# least two positive integers?
#

require 'ruby-progressbar'

sum = 0
possible = []

possible = (0..99).to_a

puts "Calculating combinations..."
perms = possible.repeated_combination(100).to_a

pbar = ProgressBar.create(:format => '%a %e |%b>%i| %p%% %t', :total => perms.size)
perms.each do |perm|
    sum += 1 if perm.inject(:+) == 100
    pbar.increment
end
puts sum
