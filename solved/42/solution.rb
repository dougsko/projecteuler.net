#!/usr/bin/env ruby
#
#
# projecteuler.net
#
# Problem 42
#
# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
#

require 'csv'
require 'yaml'

def convert_to_yaml
    words = []
    words_a = []
    CSV.open('words.txt', 'r') do |row|
        words << row
    end

    words[0].each do |word|
        words_a << word
    end

    words = []
    words_a.each do |word|
        words << word.to_s
    end

    File.open('words.yaml', 'w') do |f|
        f.puts YAML.dump words
    end
end

def get_value(word)
    values = {
        'A' => 1,
        'B' => 2,
        'C' => 3,
        'D' => 4,
        'E' => 5,
        'F' => 6,
        'G' => 7,
        'H' => 8,
        'I' => 9,
        'J' => 10,
        'K' => 11,
        'L' => 12,
        'M' => 13,
        'N' => 14,
        'O' => 15,
        'P' => 16,
        'Q' => 17,
        'R' => 18,
        'S' => 19,
        'T' => 20,
        'U' => 21,
        'V' => 22,
        'W' => 23,
        'X' => 24,
        'Y' => 25,
        'Z' => 26
    }

    value = 0
    letters = word.split('')
    letters.each do |letter|
        value += values[letter]
    end
    return value
end

def is_triangle?(num)
    1.upto 100 do |n|
        foo = n/2.0*(n+1)
        if foo == num
            return true
        end
    end
    return false
end

num_triangles = 0
words = YAML.load_file('words.yaml')

tris = []
1.upto 300 do |i|
    tris << i if is_triangle?(i)
end
words.each do |word|
    value = get_value(word)
    tris.each do |tri|
        num_triangles += 1 if tri == value
    end
end
puts num_triangles
