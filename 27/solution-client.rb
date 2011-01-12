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
	    start = @ts.take([:current, nil]).last - 1001
	    finish = start + step
	    @ts.write [:current, finish] 
            old_n = @ts.read([:old_n, nil]).last
            max = @ts.read([:max, nil]).last

            break if finish > max
			
            n = 0
            start.upto(finish) do |a|
                -10.upto 10 do |b|
                    while is_prime(n*n + a*n + b) == true
		        n += 1
		    end
                    if n > old_n
			old_n = n
                        @ts.write [:a, a]
                        @ts.write [:b, b]
                    end
                    n = 0
		end
		@ts.write [:old_n, old_n]
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
