#!/usr/bin/env ruby
#
# FFI version of my C wrapper
#
require 'rubygems'
require 'ffi'

module PEMethods
    extend FFI::Library
    ffi_lib '../tools/libpe.so'

    attach_function :gcd, [:int, :int], :int
    attach_function :phi, [:int], :float
    attach_function :is_prime, [:long], :bool
    attach_function :factorial, [:ulong], :string
    attach_function :count_digits, [:double], :int
    attach_function :is_bouncy, [:string], :bool
    attach_function :next_prime, [:string], :string
    attach_function :prob_prime, [:string], :bool
<<<<<<< HEAD
    attach_function :sieve, [:ulong, :ulong], :string
    attach_function :mpz_sieve, [:string, :string], :void
    attach_function :itoa, [:int, :int], :string
    attach_function :add_digits, [:int], :int
=======
    attach_function :sieve, [:int, :int], :string
    attach_function :itoa, [:int, :int], :string
    attach_function :add_digits, [:int], :int
    attach_function :add_digits_str, [:string], :string
>>>>>>> dbd0a1bc6541eabb2b14aa5f8909193f7bc0741d
end
