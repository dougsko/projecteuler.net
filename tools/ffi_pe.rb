#!/usr/bin/env ruby
#
# FFI version of my C wrapper
#
require 'rubygems'
require 'ffi'

module PEMethods
    extend FFI::Library
<<<<<<< HEAD:tools/ffi_pemethods.rb
    ffi_lib "../tools/helpers.so"
=======
    ffi_lib '../tools/libpe.so'
>>>>>>> 40bf5a80c5805069ca3771fa0707ac19181487c4:tools/ffi_pe.rb

    attach_function :gcd, [:int, :int], :int
    attach_function :phi, [:int], :float
    attach_function :is_prime, [:long], :bool
    attach_function :factorial, [:ulong], :string
    attach_function :count_digits, [:double], :int
end
