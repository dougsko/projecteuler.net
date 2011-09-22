#!/usr/bin/env ruby
#
# projecteuler.net
# problem 31
#
# In England the currency is made up of pound, £, and pence, p, and
# there are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
#
# 1x1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
# How many different ways can £2 be made using any number of coins?
#

require 'rubygems' 

count = 0
0.upto(200) do |p1|
    0.upto(100) do |p2|
        0.upto(40) do |p5|
            0.upto(20) do |p10|
                0.upto(10) do |p20|
                    0.upto(4) do |p50|
                        0.upto(2) do |p100|
                            0.upto(1) do |p200|
                                if p1*1 + p2*2 + p5*5 + p10*10 + p20*20 + p50*50 + p100*100 + p200*200 == 200
                                    count += 1
                                    #puts "#{p1}x1p + #{p2}x2p + #{p5}x5p + #{p10}x10p + #{p20}x20p + #{p50}x50p + #{p100}x1L + #{p200}x2L = 2L"
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
                                    
puts "Final count = #{count}"



