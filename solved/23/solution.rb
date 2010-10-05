#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 23
#
# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers is
# less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.
#

def factors(num)
    i = 1
    second_fact = 0
    facts = [i]
    2.upto Math.sqrt(num) do |i|
        if num % i == 0
            facts << i
            second_fact = num / i
            if second_fact != num
                facts << second_fact
            end
        end
    end
    facts.uniq
end

def sum_array(array)
    sum = 0
    array.collect{|x| sum += x}
    sum
end

abundants = []
1.upto 28123 do |n|
    sum = sum_array(factors(n))
    if sum > n
        abundants << n
    end
end

sum = 0
1.upto 28123 do |n|
    abundants_short = abundants.reject{ |abund| abund > n }
    to_test = abundants_short.collect{ |abund| n - abund }
    sum += n if (abundants_short & to_test).size == 0
end
puts sum
