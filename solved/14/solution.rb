#!/usr/bin/env ruby
#
# projecteuler.net
# Solution to 14
#
# Start point: 837799
# Chain Length: 525
#

class Solver
    def self.algo(start)
        new = 0
        count = 1
        while new != 1 do
            if (start % 2) == 0
                new = start / 2
            else
                new = 3 * start + 1
            end
            start = new;
            count += 1
        end
        count
    end

    def self.run(range_start, range_end)
        old = 0
        new = 0
        sp = 0

        range_start.upto range_end do |i|
            new = algo(i)
            if new > old
                old = new
                sp = i
            end
        end
        puts "Start point: #{sp}\nChain Length: #{old}"
    end
end

#Solver.run(ARGV[0].to_i, ARGV[1].to_i)
Solver.run(750000, 1000000)

