#!/usr/bin/env ruby
#
# This is my version of primec.rc

require 'drb'
require 'rinda/tuplespace'
require 'zeckendorf'

class PE297Client 

    def initialize(host)
	DRb.start_service
	@ts = DRbObject.new(nil, "druby://#{host}:7777")
    end

    def find
       	finish = 0
       	max = @ts.read([:max, nil]).last
       	step = @ts.read([:step, nil]).last
        zeck = Zeckendorf.new(1000000)
       	loop do
	        start = @ts.take([:current, nil]).last
	        finish = start + step
	        @ts.write [:current, finish] 
            sum = @ts.read([:sum, nil]).last

            break if finish > max

            start.upto(finish) do |n|
                sum += zeck.z(n)
                #puts zeck.combo.inspect
            end
            @ts.write [:sum, sum]
		end
    end
end

if ARGV[0] == nil
	puts "Usage: " + $0 + " <host>"
	exit 1
end
host = ARGV[0]
PE297Client.new(host).find
