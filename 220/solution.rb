#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 220
#
# Let D0 be the two-letter string "Fa". For n1, derive Dn from Dn-1 by
# the string-rewriting rules:
#
# "a"  "aRbFR"
# "b"  "LFaLb"
#
# Thus, D0 = "Fa", D1 = "FaRbFR", D2 = "FaRbFRRLFaLbFR", and so on.
#
# These strings can be interpreted as instructions to a computer
# graphics program, with "F" meaning "draw forward one unit", "L"
# meaning "turn left 90 degrees", "R" meaning "turn right 90 degrees",
# and "a" and "b" being ignored. The initial position of the computer
# cursor is (0,0), pointing up towards (0,1).
#
# Then Dn is an exotic drawing known as the Heighway Dragon of order n.
# For example, D10 is shown below; counting each "F" as one step, the
# highlighted spot at (18,16) is the position reached after 500 steps.
#
# What is the position of the cursor after 10^12 steps in D50 ?
# Give your answer in the form x,y with no spaces.
#

def make_directions(d)
    b = ["F", "a"]
    a = b.join
    d.times do
        b = a.split('').each do |x|
            x.gsub!(/a/, "aRbFR") if x == "a"
            x.gsub!(/b/, "LFaLb") if x =="b"
        end
        a = b.join
    end
    return a.delete("a").delete("b").split('')
end

heading = 0
point = [0, 0]
i = 0
directions = make_directions(50)
exit
directions.each do |step|
    break if i == 10**12
    if step == 'F'
        point[1] += 1 if heading == 0
        point[0] += 1 if heading == 90
        point[1] -= 1 if heading == 180
        point[0] -= 1 if heading == 270
        i += 1
    end
    if step == 'R'
        heading = (heading + 90) % 360
    end
    if step == 'L'
        heading = (heading - 90) % 360
    end
end
puts point.inspect
