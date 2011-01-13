#!/usr/bin/env ruby
#
# FFI version of my C wrapper
#
require 'rubygems'
require 'ffi'

module PEMethods
    extend FFI::Library
    ffi_lib "../tools/helpers.so"

    attach_function :gcd, [:int, :int], :int
    attach_function :phi, [:int], :float
    attach_function :is_prime, [:long], :bool
    attach_function :factorial, [:ulong], :string
    attach_function :count_digits, [:double], :int
end
