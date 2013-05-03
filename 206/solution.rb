#!/usr/bin/env ruby
#
# projecteuler.net
# problem 206
#

start = 1000000000
threads = []
num_threads = 4
0.upto(num_threads) do |i|
threads << Thread.new do
	n = start + i
	loop do
		squares = (n*n).to_s.split('')
		#puts "checking " + (n*n).to_s
		if squares.size == 19
			if( squares[0] == ['1'] and
				squares[2] == ['2'] and
				squares[4] == ['3'] and
				squares[6] == ['4'] and
				squares[8] == ['5'] and
				squares[10] == ['6'] and
				squares[12] == ['7'] and
				squares[14] == ['8'] and
				squares[16] == ['9'] and
				squares[18] == ['0'])

				puts n
				exit
			end
		end
		n += num_threads
	end
end
end
threads.each do |t|
	t.join
end
