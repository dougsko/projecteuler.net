#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 205
#
# Peter has nine four-sided (pyramidal) dice, each with faces numbered
# 1, 2, 3, 4.
# Colin has six six-sided (cubic) dice, each with faces numbered 1, 2,
# 3, 4, 5, 6.
#
# Peter and Colin roll their dice and compare totals: the highest total
# wins. The result is a draw if the totals are equal.
#
# What is the probability that Pyramidal Pete beats Cubic Colin? Give
# your answer rounded to seven decimal places in the form 0.abcdefg
#


def roll(num_dice, num_sides)
    sum = 0
    num_dice.times do |die|
        sum += rand(num_sides) + 1
    end
    sum
end

total = 0
win = 0
5000000.times do
    peter = roll(9,4)
    colin = roll(6,6)
    win += 1 if peter > colin
    total += 1
end

printf("Win percentage = %0.7f\n", win / total.to_f)


#  printf("%0.7f\n", 10/3.0)


