#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 111
#
# Considering 4-digit primes containing repeated digits it is clear that
# they cannot all be the same: 1111 is divisible by 11, 2222 is
# divisible by 22, and so on. But there are nine 4-digit primes
# containing three ones:
#
# 1117, 1151, 1171, 1181, 1511, 1811, 2111, 4111, 8111
#
# We shall say that M(n, d) represents the maximum number of repeated
# digits for an n-digit prime where d is the repeated digit, N(n, d)
# represents the number of such primes, and S(n, d) represents the sum
# of these primes.
#
# So M(4, 1) = 3 is the maximum number of repeated digits for a 4-digit
# prime where one is the repeated digit, there are N(4, 1) = 9 such
# primes, and the sum of these primes is S(4, 1) = 22275. It turns out
# that for d = 0, it is only possible to have M(4, 0) = 2 repeated
# digits, but there are N(4, 0) = 13 such cases.
#
# For d = 0 to 9, the sum of all S(4, d) is 273700.
#
# Find the sum of all S(10, d).
#

require '../tools/ffi_pe'

include PEMethods
def get_primes(n)
    primes = []
    min = (10 ** (n-1))
    i = min.to_s
    File.open("ten_digit_primes.txt", 'w') do |f|
        while((i = next_prime(i)).size == n)  do
            #primes << i
            f.puts i
        end
    end
    #primes
end

def solve(primes,d)
    d = d.to_s
    freq = {0 => 0, 1 =>0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0,
            8 => 0, 9 => 0}
    sum = {0 => 0, 1 =>0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0,
            8 => 0, 9 => 0}

    primes.each do |i|
        freq[i.count(d)] += 1
        sum[i.count(d)] += i.to_i
    end
    freq.delete_if{ |k,v| v == 0 }
    m_n_d = freq.sort{ |a,b| a[1] <=> b[1]}[0][0]
    #n_n_d = freq.sort{ |a,b| a[1] <=> b[1]}[0][1]

    #puts "M(#{n},#{d}) = #{m_n_d}"
    #puts "N(#{n},#{d}) = #{n_n_d}"
    #puts "S(#{n},#{d}) = #{sum[m_n_d]}"
    yield sum[m_n_d]
end

n = 10
sum = 0
get_primes(n)
#primes = get_primes(n)
#0.upto(9) do |d|
#    solve(primes, d) do |i|
#        sum += i
#    end
#end
#puts
#puts "For d = 0 to 9, the sum of all S(#{n}, d) is #{sum}"
#puts

