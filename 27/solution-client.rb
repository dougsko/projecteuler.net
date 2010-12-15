#!/usr/bin/env ruby
#
# This is my version of primec.rc

require 'drb'
require 'rinda/tuplespace'
require "../tools/pemethods"

include PEMethods

class PE27Client 

	def initialize(host)
		DRb.start_service
		@ts = DRbObject.new(nil, "druby://#{host}:7777")
	end

	def find
        finish = 0
        max = 0
        step = @ts.read([:step, nil]).last
        loop do
			start = @ts.take([:current, nil]).last - 1000 # start of our search space
			finish = start + step # items in our search space
            old_n = @ts.read([:old_n, nil]).last
            max = @ts.read([:max, nil]).last

            break if finish > max
			
            @ts.write [:current, finish] # write it back
            n = 0
            start.upto(finish) do |a|
                -1000.upto 1000 do |b|
                    while is_prime(n**2 + a*n + b)
                        n += 1
                    end
                    if n > old_n
                        @ts.write [:a, a]
                        @ts.write [:b, b]
                        @ts.write [:old_n, n]
                    end
                    n = 0
                end
            end
		end
	end
end

if ARGV[0] == nil
	puts "Usage: " + $0 + " <host>"
	exit 1
end
host = ARGV[0]
PE27Client.new(host).find
