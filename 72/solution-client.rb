#!/usr/bin/env ruby
#
# This is my version of primec.rc

require 'drb'
require 'rinda/tuplespace'
require "../tools/pemethods"

include PEMethods

class PE72Client 

	def initialize(host)
		DRb.start_service
		@ts = DRbObject.new(nil, "druby://#{host}:7777")
	end

	def find
        finish = 0
        max = 0
        loop do
			start = @ts.take([:current, nil]).last # start of our search space
			finish = start + @ts.read([:step, nil]).last # items in our search space
            max = @ts.read([:max, nil]).last
            break if finish > max
			@ts.write [:current, finish] # write it back

            count = @ts.read([:count, nil]).last
            start.upto(finish) do |d|
                1.upto(d) do |n|
                    if gcd(n,d) == 1 #and n < d
                        count += 1
                    end
                end
            end
            @ts.write [:count, count]
		end
        puts @ts.read([:count, nil]).last
	end
end

if ARGV[0] == nil
	puts "Usage: " + $0 + " <host>"
	exit 1
end
host = ARGV[0]
PE72Client.new(host).find
