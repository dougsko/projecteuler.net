#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 81
#
# The solution for small_matrix.txt is 2427.
#

require 'securerandom'
require 'darwinning'
require 'ruby-progressbar'
require 'pp'

class Problem81 < Darwinning::Organism
    attr_accessor :steps, :lines

    $lines = []

    File.open('small_matrix.txt') do |f|
        f.readlines.each do |line|
            $lines << line.split(',')
        end
    end

    $lines.each do |line|
        line.collect!{|x| x.to_i}
    end
    @steps = ($lines.first.size - 1) * 2

    4.times do
        @genes << Darwinning::Gene.new(name: SecureRandom.uuid, value_range: [0])
    end

    4.times do
        @genes << Darwinning::Gene.new(name: SecureRandom.uuid, value_range: [1])
    end


    def fitness
        i = 0
        j = 0
        sum = 0
        sum += $lines[i][j]
        return 1000000 if genotypes.values.size != 8 or genotypes.values.count(1) != 4
        genotypes.values.each do |k|
            if k == 0 # go down
                i += 1
            elsif k == 1 # go right
                j += 1
            end
            sum += $lines[i][j]
        end
        return sum
    end
end

p = Darwinning::Population.new(organism: Problem81, population_size: 50, fitness_goal: 0, generations_limit: 500)

#puts "First Generation of Population!"
#p.members.each { |m| pp m }

p.evolve!

puts "Solution:"
pp p.best_member.fitness if p.best_member.fitness != 1000000


