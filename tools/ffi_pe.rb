#!/usr/bin/env ruby
#
# FFI version of my C wrapper
#
require 'ffi'

module PEMethods
    extend FFI::Library
    ffi_lib '/home/dprostko/bin/projecteuler.net/tools/libpe.so'

    attach_function :gcd, [:int, :int], :int
    attach_function :phi, [:int], :float
    attach_function :is_prime, [:long], :bool
    attach_function :factorial, [:ulong], :string
    attach_function :count_digits, [:double], :int
    attach_function :is_bouncy, [:string], :bool
    attach_function :next_prime, [:string], :string
    attach_function :prob_prime, [:string], :bool
    attach_function :itoa, [:int, :int], :string
    attach_function :add_digits, [:int], :int
    attach_function :add_digits_str, [:string], :string
    attach_function :is_palindrome, [:long], :bool
    attach_function :is_step, [:string], :bool
    attach_function :is_pandigital, [:string], :bool
    attach_function :is_one_nine_pandigital, [:string], :bool
    attach_function :fib, [:ulong], :string
    attach_function :sum_of_squares_str, [:string], :string

    def is_pandigital?(n)
        a = n.to_s.split('')
        return true if a.sort.uniq == ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return false
    end
end
