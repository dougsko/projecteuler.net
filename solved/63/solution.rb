#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 63
#
# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the
# 9-digit number, 134217728=8^9, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?
#

count = 0
<<<<<<< HEAD:63/solution.rb
i = 0
loop do
    digits = i.to_s.size
    1.upto(10000) do |j|
        pow = j ** digits
        break if pow > i
        if pow == i
            count += 1
            puts "#{j}^#{digits} = #{i}"
        end
    end
    i += 1
=======
1.upto(9) do |n|
    count += (1 / (1 - Math::log10(n))).to_i
>>>>>>> e00379407b4f55583e38b40a7d50e75d46e98da4:solved/63/solution.rb
end
