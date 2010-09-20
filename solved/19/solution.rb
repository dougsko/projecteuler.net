#!/usr/bin/env ruby
#
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
#

require 'date'

sundays = 0
1901.upto 2000 do |year|
    1.upto 12 do |month|
        date = Date.new(year, month, 1)
        sundays += 1 if date.wday == 0
    end
end
puts sundays
