#!/usr/bin/env ruby
#
# projecteuler.net
# problem 200
#

require '../tools/ffi_pe.rb'

include PEMethods

def make_list
    p = '1'
    File.open('primes.txt', 'w') do |f|
        while(p.to_i < 1000000) do
            p = next_prime(p)
            f.puts p
        end
    end
end

#make_list

primes = []
File.open('primes.txt') do |f|
    f.readlines.each do |line|
        primes << line.chomp
    end
end

squbes = []
# 20000 = 29028200067
primes[0..50000].permutation(2) do |permute|
    if permute[0] != permute[1]
        sqube = permute[0].to_i**2 * permute[1].to_i**3
    end
    squbes << sqube if sqube.to_s.match('200')
end
squbes.sort!
puts squbes[199]

