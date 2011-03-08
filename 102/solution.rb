#!/usr/bin/env ruby
#
#  projecteuler.net
#
#  problem 102
#
#  Three distinct points are plotted at random on a Cartesian plane, for
#  which -1000 <= x, y <= 1000, such that a triangle is formed.
#
#  Consider the following two triangles:
#
#  A(-340,495), B(-153,-910), C(835,-947)
#
#  X(-175,41), Y(-421,-714), Z(574,-645)
#
#  It can be verified that triangle ABC contains the origin, whereas
#  triangle XYZ does not.
#
#  Using triangles.txt (right click and 'Save Link/Target As...'), a 27K
#  text file containing the co-ordinates of one thousand "random"
#  triangles, find the number of triangles for which the interior
#  contains the origin.
#

class Point
    attr_reader :north, :south, :east, :west
    def initialize(x, y)
        @x = x
        @y = y
        @north = false
        @south = false
        @east = false
        @west = false

        if @x < 0
            @west = true
        elsif @x > 0
            @east = true
        end

        if @y < 0
            @south = true
        elsif @y > 0
            @north = true
        end
    end
end

class Triangle
    def initialize(p1, p2, p3)
        @p1 = p1
        @p2 = p2
        @p3 = p3
    end

    def dot(a, b)
        sum = 0
        a.zip(b){|a,b| sum += a*b}
        sum
    end

    def cross(a, b)
        a[0]*b[1] - b[0]*a[1]
    end

    def points
        [@p1, @p2, @p3]
    end

    def contains_origin?
        n = 0
        s = 0
        e = 0
        w = 0
        self.points.each do |point|
            n += 1 if point.north
            s += 1 if point.south
            e += 1 if point.east
            w += 1 if point.west
        end
        if (n >= 2 and s == 1) or (s >= 2 and n == 1)
            if (e >= 2 and w == 1) or (w >= 2 and e == 1)
                return true
            end
        end
        return false
    end
end


p1 = Point.new(-340, 495)
p2 = Point.new(-153, -910)
p3 = Point.new(835, -947)

p4 = Point.new(-175, 41)
p5 = Point.new(-421, -714)
p6 = Point.new(574, -645)

t1 = Triangle.new(p1, p2, p3)
t2 = Triangle.new(p4, p5, p6)

puts t1.contains_origin?
puts t2.contains_origin?

