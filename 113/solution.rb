#!/usr/bin/env ruby
#
#
#

require 'gmp'
require '../tools/ffi_pe'
require 'ruby-progressbar'

include PEMethods

count = GMP::Z.new(0)
base = GMP::Z(10)
upper = base ** 6
j = GMP::Z.new

while j < upper
    if(! is_bouncy(j.to_s))
        count += 1
    end
    j += 1
end
puts (count-1).to_s

