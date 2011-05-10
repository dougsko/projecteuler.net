#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 297
#
# Each new term in the Fibonacci sequence is generated by adding the
# previous two terms.
# Starting with 1 and 2, the first 10 terms will be: 1, 2, 3, 5, 8, 13,
# 21, 34, 55, 89.
#
# Every positive integer can be uniquely written as a sum of
# nonconsecutive terms of the Fibonacci sequence. For example, 100 = 3 +
# 8 + 89.
# Such a sum is called the Zeckendorf representation of the number.
#
# For any integer n>0, let z(n) be the number of terms in the Zeckendorf
# representation of n.
# Thus, z(5)= 1, z(14) = 2, z(100) = 3 etc.
# Also, for 0 < n < 10^6, sum(z(n)) = 7894453.
#
# Find sum(z(n)) for 0 < n < 10^17.
#

class Zeckendorf
    def initialize(n)
        @fibs = [1, 2]
        while @fibs.last <= n do
            @fibs << @fibs[@fibs.size - 1] + @fibs[@fibs.size - 2]
        end
    end

    def z(n)
        i = 0
        subset = []
        seq = []
        sum = 0
        @fibs.each do |fib|
            if fib <= n
                subset << fib
            end
        end
        subset.reverse!

        i = 1
        win = 0
        loop do
            subset.combination(i).each do |combo|
                sum = 0
                combo.each do |elem| 
                    sum += elem
                end
                if sum == n
                    return combo.size
                end
            end
            i += 1
        end

    end
end

sum = 0
z_n = 0
zeck = Zeckendorf.new(1000000)
0.upto(100) do |n|
    z_n = zeck.z(n)
    sum += z_n
    puts "z(#{n}) = #{z_n}"
end
puts sum
