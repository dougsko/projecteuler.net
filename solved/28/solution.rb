#!/usr/bin/env ruby
#
# projecteuler.net
# problem 28
#
# Starting with the number 1 and moving to the right in a clockwise
# direction a 5 by 5 spiral is formed as follows:
#
# It can be verified that the sum of the numbers on the diagonals is
# 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001
# spiral formed in the same way?
#

# make 500x500 spiral matrix. 1-1002001
# first try making 5x5 matrix, 1-25
# start at (2,2) and spiral around

@length = 5
@limit = @length - 1

def make_spiral(length)
    length = @length
    limit = @limit
    spiral = []
    row = []
    length.times do |i|
        spiral[i] = []
        length.times do |j|
            spiral[i] << 0
        end
    end
    spiral[limit/2][limit/2] = 1
    spiral
end

def print_spiral(spiral)
    length = @length
    length.times do |i|
        length.times do |j|
            print spiral[i][j], " "
        end
        puts
    end
end

def fill_spiral(spiral)
    start = @length * @length
    spiral[@limit][@limit] = start
    x_subtractor = 0
    y_subtractor = 0
    i, j = 4
    spiral[4][4] = start
    @length.downto(0 + x_subtractor) do |i|
        spiral[i] << start - 1
    end
    
end

spiral = make_spiral(5)
fill_spiral(spiral)
print_spiral(spiral)


