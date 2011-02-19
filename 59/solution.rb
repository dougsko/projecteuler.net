#!/usr/bin/env ruby
#
# projecteuler.net
#
# problem 59
#
# Each character on a computer is assigned a unique code and the
# preferred standard is ASCII (American Standard Code for Information
# Interchange). For example, uppercase A = 65, asterisk (*) = 42, and
# lowercase k = 107.
#
# A modern encryption method is to take a text file, convert the bytes
# to ASCII, then XOR each byte with a given value, taken from a secret
# key. The advantage with the XOR function is that using the same
# encryption key on the cipher text, restores the plain text; for
# example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
#
# For unbreakable encryption, the key is the same length as the plain
# text message, and the key is made up of random bytes. The user would
# keep the encrypted message and the encryption key in different
# locations, and without both "halves", it is impossible to decrypt the
# message.
#
# Unfortunately, this method is impractical for most users, so the
# modified method is to use a password as a key. If the password is
# shorter than the message, which is likely, the key is repeated
# cyclically throughout the message. The balance for this method is
# using a sufficiently long password key for security, but short enough
# to be memorable.
#
# Your task has been made easy, as the encryption key consists of three
# lower case characters. Using cipher1.txt (right click and 'Save
# Link/Target As...'), a file containing the encrypted ASCII codes, and
# the knowledge that the plain text must contain common English words,
# decrypt the message and find the sum of the ASCII values in the
# original text.
#
require 'yaml'

# load letter freq
@letter_freq = YAML.load_file('letter_freq.yaml')

# load cipher text
@cipher_text = []
text_a = []
File.open('cipher1.txt', 'r') do |f|
    text_a << f.readlines
end
@cipher_text = text_a.join(',').chomp.split(',')

# separate out every third letter
i = 0
sub_cipher1 = []
while(@cipher_text[i] != nil) do
    sub_cipher1 << @cipher_text[i+2].to_i
    i += 3
end

# XOR with key and print
def decrypt(cipher_text, key)
    i = 0
    string = "" 
    cipher_text.each do |letter|
        string << (letter.to_i ^ key[i % key.length]).chr
        i += 1
    end
    string
end

# find relative frequency for each letter
# compare with known values
# calculate error, average and return
def analyze_freqs(string)
    test_freqs = {}
    errors = []
    ('a'..'z').each do |letter|
        test_freqs[letter] = string.count(letter) / string.length.to_f
        errors << (@letter_freq[letter] - test_freqs[letter]).abs
    end
    errors.inject(0.0) { |sum, el| sum + el } / errors.size
end

lowest_error = 10
lowest = 10
97.upto(122) do |i|
    string = decrypt(sub_cipher1, [i])
    error = analyze_freqs(string)
    if error < lowest_error
        lowest = i
        lowest_error = error
    end
end

# solution: god
#puts lowest.chr
#puts decrypt(sub_cipher1, [?d])

puts decrypt(@cipher_text, [?g,?o, ?d]) 
