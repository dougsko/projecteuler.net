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
require '../tools/pemethods'

include PEMethods

class TupleSpacePE27

	def initialize
		@ts = Rinda::TupleSpace.new
	end

	##
	# Lists primes as they are added to the TupleSpace.
	def list_count
		Thread.start do
			notifier = @ts.notify 'write', [:old_end, nil]
			notifier.each do |_, t|
				#puts t.last
                puts "n: #{@ts.read([:old_n, nil]).last} a: #{@ts.read([:a, nil]).last} b: #{@ts.read([:b, nil]).last} a*b: #{@ts.read([:a, nil]).last.to_i* @ts.read([:b, nil]).last.to_i}"
			end
		end
	end

	def run(host)
        list_count 

		@ts.write [:old_n, 0] # seed prime
		@ts.write [:current, 0] # next value to search
		@ts.write [:step, 10] # range of values to search
        @ts.write [:max, 1000]
        @ts.write [:a, 0]
        @ts.write [:b, 0]

		DRb.start_service "druby://#{host}:7777", @ts

		DRb.thread.join
        
	end
end

if ARGV[0] == nil
	puts "Usage: " + $0 + " <host>"
	exit 1
end
host = ARGV[0]
TupleSpacePE27.new.run(host)
