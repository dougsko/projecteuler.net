#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 22
#
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
#
# What is the total of all the name scores in the file?
#
require 'csv'

names = []

CSV.open('names.txt', 'r') do |f|
    names = f
end
names.sort!

def score(name, index)
    array = []
    sum = 0
    array = name.unpack('C*').collect{|cell| cell - 64}
    array.collect{|cell| sum += cell}
    sum * index
end

total = 0
0.upto names.size-1 do |i|
    #puts names[i] + ": " + score(names[i], i+1).to_s
    total += score(names[i], i+1)
end
puts total

