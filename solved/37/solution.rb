#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 37
#
# The number 3797 has an interesting property. Being prime itself, it is
# possible to continuously remove digits from left to right, and remain
# prime at each stage: 3797, 797, 97, and 7. Similarly we can work from
# right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from
# left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
#

require '../tools/helpers.rb'

sum = 0

p = Prime.new
4.times do
    p.next
end

def truncatable_pop?(test)
    array = test.to_s.split('')

    (array.size - 1).times do 
        array.pop
        new_test = array.join('').to_i
        return false if ! new_test.isPrime?
    end
    true
end

def truncatable_shift?(test)
    array = test.to_s.split('')
    
    (array.size - 1).times do
        array.shift
        new_test = array.join('').to_i
        return false if ! new_test.isPrime?
    end 
    true
end

count = 0
loop do
    test = p.next

    if truncatable_pop?(test) && truncatable_shift?(test)
        count += 1
        sum += test
        puts "#{count}. #{test}"
        if count == 11
            puts "Sum = #{sum}"
            exit
        end
    end
end
