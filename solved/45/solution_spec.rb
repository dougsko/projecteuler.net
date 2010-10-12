#!/usr/bin/env ruby
#
# tests

require 'rubygems'
require 'spec'
require 'solution.rb'

describe "Triangle" do
    it "Creates triangle numbers" do
        tri = Triangle.new
        triangles = []
        5.times do 
            triangles << tri.next
        end
        triangles.should eql [1, 3, 6, 10, 15]
    end
end

describe "Pentagonal" do
    it "Creates pentagonal numbers" do
        pent = Pentagonal.new
        pents = []
        5.times do
            pents << pent.next
        end
        pents.should eql [1, 5, 12, 22, 35]
    end
end

describe "Hexagonal" do
    it "Creates hexagonal numbers" do
        hex = Hexagonal.new
        hexes = []
        5.times do
            hexes << hex.next
        end
        hexes.should eql [1, 6, 15, 28, 45]
    end
end    

