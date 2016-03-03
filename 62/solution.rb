#!/usr/bin/env ruby
#
# projecteuler.net
# problem 62
#
#

require 'gmp'
require 'parallel'

i = 1
count = 0
while true
    #count = (i**3).to_s.chars.permutation.map(&:join).map{|x| GMP::Z.new(x.to_i)}.uniq.select{|x| x.to_s.size == (i**3).to_s.size}.select{|x| x.rootrem(3)[1] == 0}.count
    count = (i**3).to_s.chars.permutation.map(&:join).uniq.map{|x| GMP::Z.new(x.to_i)}.select{|x| x.rootrem(3)[1] == 0}.count
    puts "#{i}^3 = #{i**3}" if count == 3
    i += 1
end

