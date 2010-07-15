#!/usr/bin/env ruby
#
#
# Find first term of Fib seq to contain 1000 digits
#

def fib(n)
    n0 = 0
    n1 = 1
    0.upto(n-1) do |i|
        naux = n1
        n1 = n0 + n1
        n0 = naux
    end
    return n1
end

0.upto 1000000 do |i|
    num = fib(i)
    if num.to_s.size == 1000
        puts "#{i+1} " + num.to_s
        exit
    end
end


