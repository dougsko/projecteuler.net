#!/usr/bin/env ruby
#
# projecteuler.net 87
#

require '../tools/ffi_pe'

include PEMethods

max = 500
count = 0

2.upto max do |i|
    2.upto max do |j|
        2.upto max do |k|
            if is_prime(i) and is_prime(j) and is_prime(k)
                sum =  i*i + j*j*j + k*k*k*k
                if sum < max
                    puts "#{sum} = #{i}**2 + #{j}**3 + #{k}**4"
                    count += 1
                end
            end
        end
    end
end
puts count
