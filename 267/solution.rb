#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 267
#
# You are given a unique investment opportunity.
#
# Starting with £1 of capital, you can choose a fixed proportion, f, of
# your capital to bet on a fair coin toss repeatedly for 1000 tosses.
#
# Your return is double your bet for heads and you lose your bet for
# tails.
#
# For example, if f.=.1/4, for the first toss you bet £0.25, and if
# heads comes up you win £0.5 and so then have £1.5. You then bet £0.375
# and if the second toss is tails, you have £1.125.
#
# Choosing f to maximize your chances of having at least £1,000,000,000
# after 1,000 flips, what is the chance that you become a billionaire?
#
# All computations are assumed to be exact (no rounding), but give your
# answer rounded to 12 digits behind the decimal point in the form
# 0.abcdefghijkl.
#

require 'rational'

class Billionaire
    attr_reader :money, :f

    def initialize(num,den)
        srand
        @f = Rational(num,den)
        @money = 1
    end

    def win
        @money += 2*(@money * @f)
    end

    def lose
        @money -= @money * @f
    end

    def flip
        win if rand(2) == 0
        lose if rand(2) == 1
    end
end

flips = 0
best_bet = 0
res = {}

1.upto(20) do |num|
    1.upto(20) do |den|
        next if num / den.to_f >= 1
        b = Billionaire.new(num, den)
        1000.times do |i|
            if b.money >= 1000000000
                res[b.f] = i
                break
                #if flips == 0 or i < flips
                #    flips = i
                #    best_bet = b.f
                #    break
                #end
            end
            b.flip
        end
    end
end

File.open('res.dat', 'w') do |f|
    res.sort{|a, b| a[0] <=> b[0]}.each do |elem|
        f.puts "#{elem[0].to_f} #{elem[1]}"
    end
end
