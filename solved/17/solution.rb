#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 17
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
#
#

ones = [
    'one', 
    'two', 
    'three', 
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
]

tens = [ 
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety',
]

total = ""

ones.each do |i|
    #puts i
    total += i
end

tens.each do |i|
    #puts i
    total += i
    0.upto 8 do |j|
        #puts "#{i} #{ones[j]}"
        total += "#{i} #{ones[j]}"
    end
end

0.upto 8 do |i|
    #puts "#{ones[i]} hundred"
    total += "#{ones[i]} hundred"
    0.upto 18 do |l|
        #puts "#{ones[i]} hundred and #{ones[l]}"
        total += "#{ones[i]} hundred and #{ones[l]}"
    end
    tens.each do |j|
        #puts "#{ones[i]} hundred and #{j}"
        total += "#{ones[i]} hundred and #{j}"
        0.upto 8 do |k|
            #puts "#{ones[i]} hundred and #{j} #{ones[k]}"
            total += "#{ones[i]} hundred and #{j} #{ones[k]}"
        end
    end
end
#puts "one thousand"
total += "one thousand"

puts "Total letters: #{total.gsub(/\s+/, '').size}"
