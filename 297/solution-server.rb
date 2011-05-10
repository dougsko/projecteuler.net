#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 27
#
# distributed version
#

require 'drb'
require 'rinda/tuplespace'

class TupleSpacePE297

	def initialize
		@ts = Rinda::TupleSpace.new
	end

	##
	# Lists primes as they are added to the TupleSpace.
	def list_count
		Thread.start do
			notifier = @ts.notify 'write', [:sum, nil]
			notifier.each do |_, t|
			    puts "\nsum = #{t.last}"
                puts "current = #{@ts.read([:current, nil]).last}\n"
                #puts "sum = #{@ts.read([:sum, nil]).sort.last} a: #{@ts.read([:a, nil]).last} b: #{@ts.read([:b, nil]).last} a*b: #{@ts.read([:a, nil]).last.to_i* @ts.read([:b, nil]).last.to_i}"
			end
		end
	end

	def run(host)
    	list_count 

		@ts.write [:sum, 0] # seed prime
		@ts.write [:current, 1] # next value to search
		@ts.write [:step, 500] # range of values to search
        @ts.write [:max, 1000000]

		DRb.start_service "druby://#{host}:7777", @ts

		DRb.thread.join
        
	end
end

if ARGV[0] == nil
	puts "Usage: " + $0 + " <host>"
	exit 1
end
host = ARGV[0]
TupleSpacePE297.new.run(host)
