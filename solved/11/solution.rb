#!/usr/bin/env ruby
#
# projecteuler.net
#
# Problem 11
#
# What is the greatest product of four adjacent numbers in any direction (up, down, left, right, or diagonally) in the 2020 grid?
#
# A. 70600674
#

require 'yaml'

@grid = YAML.load_file('grid.yml')
@biggest = 0
@product = 0

def test_hor
    0.upto(19) do |i|
        0.upto(16) do |j|
            @product = @grid[i][j] * @grid[i][j+1] * @grid[i][j+2] * @grid[i][j+3]
            if @product > @biggest
                @biggest = @product
            end
        end
    end
end

def test_vert
    0.upto(16) do |i|
        0.upto(19) do |j|
            @product = @grid[i][j] * @grid[i+1][j] * @grid[i+2][j] * @grid[i+3][j]
            if @product > @biggest
                @biggest = @product
            end
        end
    end
end

def test_diag_lr
    0.upto(16) do |i|
        0.upto(16) do |j|
            @product = @grid[i][j] * @grid[i+1][j+1] * @grid[i+2][j+2] * @grid[i+3][j+3]
            if @product > @biggest
                @biggest = @product
            end
        end
    end
end

def test_diag_rl
    0.upto(16) do |i|
        19.downto(3) do |j|
            @product = @grid[i][j] * @grid[i+1][j-1] * @grid[i+2][j-2] * @grid[i+3][j-3]
            if @product > @biggest
                @biggest = @product
            end
        end
    end
end

test_hor
test_vert
test_diag_lr
test_diag_rl
puts "Biggest product: #{@biggest}"
