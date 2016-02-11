#!/usr/bin/env ruby
#
# projecteuler.net
# problem 200
#
# Getting an answer but it's apparently wrong...
#

require 'prime'
require 'ruby-progressbar'
require '../tools/ffi_pe'

include PEMethods

def is_prime_proof?(n)
    chars = n.to_s.chars
    chars.size.times do |i|
        0.upto(9) do |new_number|
            chars[i] = new_number
            if prob_prime(chars.join)
                return false
            end
        end
        chars = n.to_s.chars
    end
    return true
end

primes = Prime.first(5000)
squbes = []
possible_prime_proof = []
prime_proofs = []

perms = primes.permutation(2)
pbar = ProgressBar.create(:title => "Squbes calulated", :total => perms.size, :format => '%a %e |%b>%i| %p%% %t')
perms.each do |combo|
    squbes << combo[0]**2 * combo[1]**3
    pbar.increment
end

pbar = ProgressBar.create(:title => "Squbes matched", :total => squbes.size, :format => '%a %e |%b>%i| %p%% %t')
squbes.sort.each do |sqube|
    if sqube.to_s.match(/200/)
        possible_prime_proof << sqube
    end
    pbar.increment
end

pbar = ProgressBar.create(:title => "Squbes prime proofed", :total => possible_prime_proof.size, :format => '%a %e |%b>%i| %p%% %t')
possible_prime_proof.each do |candidate|
    if is_prime_proof?(candidate)
        prime_proofs << candidate 
    end
    pbar.increment
    exit if prime_proofs.size > 201
end

prime_proofs.each do |prime_proof|
    puts "#{prime_proofs.index(prime_proof) + 1}: #{prime_proof}"
end

