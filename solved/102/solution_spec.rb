#!/usr/bin/env ruby
#
#
# spec test
#
require 'rubygems'
require 'rspec'
require 'solution.rb'

describe "problem 102" do
    it "tests if a point is in a triangle or not" do
        test_point = Point.new(0, 0)

        p1 = Point.new(-340, 495)
        p2 = Point.new(-153, -910)
        p3 = Point.new(835, -947)

        p4 = Point.new(-175, 41)
        p5 = Point.new(-421, -714)
        p6 = Point.new(574, -645)

        t1 = Triangle.new(p1, p2, p3)
        t2 = Triangle.new(p4, p5, p6)

        t1.contains_point?(test_point).should == true
        t2.contains_point?(test_point).should == false
    end
end

