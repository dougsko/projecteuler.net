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
    def initialize(x, y)
        @p = [x, y]
        @p
    end

    def x
        @p[0]
    end

    def y
        @p[1]
    end
end

class Triangle
    def initialize(p1, p2, p3)
        @p1 = p1
        @p2 = p2
        @p3 = p3
    end

    def points
        [@p1, @p2, @p3]
    end

    # http://mathforum.org/library/drmath/view/54503.html
    def contains_point?(test_p)
        m1 = (@p2.y - @p1.y) / (@p2.x - @p1.x)
        b1 = -1 * ( m1 * @p1.x - @p1.y )
        y1 = m1 * @p3.x + b1
        d1 = m1 * test_p.x + b1
        puts "y = #{m1}x + #{b1}"
        puts @p3.y - y1
        puts d1
    end
end

test_point = Point.new(0, 0)

p1 = Point.new(-340, 495)
p2 = Point.new(-153, -910)
p3 = Point.new(835, -947)

p4 = Point.new(-175, 41)
p5 = Point.new(-421, -714)
p6 = Point.new(574, -645)

t1 = Triangle.new(p1, p2, p3)
t2 = Triangle.new(p4, p5, p6)

puts t1.contains_point?(test_point)
puts t2.contains_point?(test_point)

