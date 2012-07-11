#!/usr/bin/env ruby
#
# projecteuler.net
# problem 179
#
# Find the number of integers 1 < n < 10^7, for which n and n + 1 have the
# same number of positive divisors. For example, 14 has the positive
# divisors 1, 2, 7, 14 while 15 has 1, 3, 5, 15.
#
# 100000 = 10585

def num_of_divisors(n)
    count = 1
    1.upto(n/2+1) do |i|
        if n % i == 0
            count += 1
        end
    end
    count
end

ans = 0
max = ARGV[0].to_i - 1
1.upto(max) do |n|
    if num_of_divisors(n) == num_of_divisors(n+1)
        ans += 1
    end
end
puts "Answer: #{ans}"
