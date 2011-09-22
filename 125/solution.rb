#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 125
#
# The palindromic number 595 is interesting because it can be written as
# the sum of consecutive squares: 6^2 + 7^2 + 8^2 + 9^2 + 10^2 + 11^2 + 12^2.
#
# There are exactly eleven palindromes below one-thousand that can be
# written as consecutive square sums, and the sum of these palindromes
# is 4164. Note that 1 = 0^2 + 1^2 has not been included as this problem
# is concerned with the squares of positive integers.
#
# Find the sum of all the numbers less than 10^8 that are both
# palindromic and can be written as the sum of consecutive squares.
#
# wrong answer: 2916867073

require '../tools/ffi_pe'

include PEMethods

max = 10**8
squares = []
pals = []
sum = 0
count = 0

1.upto(Math.sqrt(max)) do |i|
    squares << i ** 2
end

i = 0
j = i

while i <= squares.length - 2 do
    sum = squares[i..j].inject(:+)
    if is_palindrome(sum) and sum != 1 and sum <= max
        pals << sum
    end
    j += 1
    if j == squares.length
        i += 1
        j = i + 1
    end
end
#puts pals.inspect
#puts pals.size
puts pals.inject(:+)



