#!/usr/bin/env ruby
#
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 * 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.
# 
# 45228

array = []
res = []

1.upto 2000 do |i|
    1.upto 2000 do |j|
        prod = i * j
        array = [i, j, prod]
        array = array.join.split('')
        if array.sort == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            puts "#{i} * #{j} = #{prod}"
            res << prod
        end
        array = []
    end
end
sum = 0
res.uniq!
res.collect{|x| sum += x}
puts "Sum of products = #{sum}"
