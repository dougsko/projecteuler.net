#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 74
#
# The number 145 is well known for the property that the sum of the
# factorial of its digits is equal to 145:
#
# 1! + 4! + 5! = 1 + 24 + 120 = 145
#
# Perhaps less well known is 169, in that it produces the longest chain
# of numbers that link back to 169; it turns out that there are only
# three such loops that exist:
#
# 169 -> 363601 -> 1454 -> 169
# 871 -> 45361 -> 871
# 872 -> 45362 -> 872
#
# It is not difficult to prove that EVERY starting number will
# eventually get stuck in a loop. For example,
#
# 69 -> 363600 -> 1454 -> 169 -> 363601 (-> 1454)
# 78 -> 45360 -> 871 -> 45361 (-> 871)
# 540 -> 145 (-> 145)
#
# Starting with 69 produces a chain of five non-repeating terms, but the
# longest non-repeating chain with a starting number below one million
# is sixty terms.
#
# How many chains, with a starting number below one million, contain
# exactly sixty non-repeating terms?
#

require '../tools/pemethods'

include PEMethods

def sum_of_facts(num)
    sum = 0
    num_a = num.to_s.split('')
    num_a.each do |n|
        sum += fact(n.to_i)
    end
    sum.to_i
end

def find_long_chain(i)
    sof = 0
    sum_of_facts_a = []
    sum_of_facts_a << i
    sof = sum_of_facts(sum_of_facts_a.last)
    while(! sum_of_facts_a.include?(sof))
        sum_of_facts_a << sof
        sof = sum_of_facts(sum_of_facts_a.last)
    end
    sum_of_facts_a.length
end

count = 0
1.upto(1000000) do |i|
    count += 1 if find_long_chain(i) == 60
end
puts count
