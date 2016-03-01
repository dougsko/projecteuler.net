#!/usr/bin/env ruby
#
# projecteuler.net
# problem 357
#
# Consider the divisors of 30: 1,2,3,5,6,10,15,30.
# It can be seen that for every divisor d of 30, d+30/d is prime.
#
# Find the sum of all positive integers n not exceeding 100 000 000
# such that for every divisor d of n, d+n/d is prime.
#
# 1739023853136 is wrong...
# 1739023853137 is right.  why off by one?
#

require '../tools/ffi_pe'
require 'parallel'
require 'ruby-progressbar'

include PEMethods

sum = 0
# sum doesnt work with multi processed.  use jruby to get the same
# speedup with threads.
File.open('output.txt', 'w') do |f|
    Parallel.map( (2..100000000) , :in_threads => 7, :progress => "Working"){ |n| f.puts n if divisors(n).map{|d| d + n / d}.all?{|x| x.prime?}}
end


