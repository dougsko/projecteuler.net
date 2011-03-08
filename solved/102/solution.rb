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
        # p1 - p2
        m1 = (@p2.y - @p1.y) / (@p2.x - @p1.x).to_f
        b1 = -1 * ( m1 * @p1.x - @p1.y )
        y1 = m1 * @p3.x + b1
        d1 = m1 * test_p.x + b1
        #puts "y = #{m1}x + #{b1}"
        #puts @p3.y - y1
        #puts test_p.y - d1
        if ((@p3.y - y1) < 0 and (test_p.y - d1) < 0) or 
            ((@p3.y - y1) > 0 and (test_p.y - d1) > 0)
            foo1 = 'yes'
        end

        # p2 - p3
        m2 = (@p3.y - @p2.y) / (@p3.x - @p2.x).to_f 
        b2 = -1 * ( m2 * @p2.x - @p2.y )
        y2 = m2 * @p1.x + b2
        d2 = m2 * test_p.x + b2
        #puts "y = #{m2}x + #{b2}"
        #puts @p1.y - y2
        #puts test_p.y - d2
        if ((@p1.y - y2) < 0 and (test_p.y - d2) < 0) or
            ((@p1.y - y2) > 0 and (test_p.y - d2) > 0)
            foo2 = 'yes'
        end

        # p3 - p1
        m3 = (@p1.y - @p3.y) / (@p1.x - @p3.x).to_f
        b3 = -1 * ( m3 * @p3.x - @p3.y )
        y3 = m3 * @p2.x + b3
        d3 = m3 * test_p.x + b3
        #puts "y = #{m2}x + #{b2}"
        #puts @p2.y - y3
        #puts test_p.y - d3
        if ((@p2.y - y3) < 0 and (test_p.y - d3) < 0) or
            ((@p2.y - y3) > 0 and (test_p.y - d3) > 0)
            foo3 = 'yes'
        end
        
        if foo1 == 'yes' and foo2 == 'yes' and foo3 == 'yes'
            return true
        end
        return false
    end
end

test_point = Point.new(0, 0)

points = []
File.open('triangles.txt') do |f|
    f.readlines.each do |line|
        points << line.chomp
    end
end

count = 0
points.each do |point_set|
    point_a = point_set.split(',')
    point_a.collect!{|x| x.to_i }
    p1 = Point.new(point_a[0], point_a[1])
    p2 = Point.new(point_a[2], point_a[3])
    p3 = Point.new(point_a[4], point_a[5])
    t = Triangle.new(p1, p2, p3)
    if t.contains_point?(test_point)
        count += 1
    end
end
puts count

