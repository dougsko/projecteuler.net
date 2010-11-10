#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 72
#
# distributed version
#

require 'drb'
require 'rinda/tuplespace'
require '../tools/pemethods'

include PEMethods

class TupleSpacePE72

	def initialize
		@ts = Rinda::TupleSpace.new
	end

	##
	# Lists primes as they are added to the TupleSpace.
	def list_count
		Thread.start do
			notifier = @ts.notify 'write', [:count, nil]
			notifier.each do |_, t|
				puts t.last
			end
		end
	end

	def run(host)
		list_count

		@ts.write [:count, 0] # seed prime
		@ts.write [:current, 2] # next value to search
		@ts.write [:step, 1000] # range of values to search
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
TupleSpacePE72.new.run(host)
