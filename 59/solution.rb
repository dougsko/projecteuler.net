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

@letter_freq = YAML.load_file('letter_freq.yaml')
@cipher_text = []
text_a = []

File.open('cipher1.txt', 'r') do |f|
    text_a << f.readlines
end
@cipher_text = text_a.join(',').chomp.split(',')

def analyze_freqs(text_a)
    freqs = {'a' => 0,
             'b' => 0,
             'c' => 0,
             'd' => 0,
             'e' => 0,
             'f' => 0,
             'g' => 0,
             'h' => 0,
             'i' => 0,
             'j' => 0,
             'k' => 0,
             'l' => 0,
             'm' => 0,
             'n' => 0,
             'o' => 0,
             'p' => 0,
             'q' => 0,
             'r' => 0,
             's' => 0,
             't' => 0,
             'u' => 0,
             'v' => 0,
             'w' => 0,
             'x' => 0,
             'y' => 0,
             'z' => 0
    }
             
    text_a.each do |letter|
        next if letter < 97 or letter > 122
        freqs[letter.chr.downcase] += 1
    end
    test_freqs = []
    freqs.sort{ |a, b| b[1] <=> a[1]}.each { |elem|
        test_freqs << elem[0]
    }
    i = 0
    correct = 0
    0.upto 25 do |i|
        if test_freqs[i] == @letter_freq[i]
            correct += 1
        end
    end

    correct / 26.0
end


# lower case letters
# 97 - 122 base10
# 32 is a space

# puts 65.to_s(16)
# puts 65.chr
# 
# translate each cipher array and compare letter freqs
#
@cipher1 = []
@cipher2 = []
@cipher3 = []
i = 0
while(@cipher_text[i+3] != nil) do
    @cipher1 << @cipher_text[i].to_i
    @cipher2 << @cipher_text[i+1].to_i
    @cipher3 << @cipher_text[i+2].to_i
    i += 3
end

ciphers = [@cipher1, @cipher2, @cipher3]
ans = []
97.upto(122) do |i|
    ciphers.each do |cipher|
        temp_cipher = cipher
        temp_cipher.collect!{ |letter| letter ^ i }
        percent_correct =  analyze_freqs(temp_cipher)
        puts "#{i}: #{percent_correct}"
        ans << i
    end
end

i = 0
#while(@cipher_text[i+2] != nil) do
    #print (@cipher_text[i].to_i ^ ans[0]).chr
    #print (@cipher_text[i+1].to_i ^ ans[1]).chr
    #print (@cipher_text[i+2].to_i ^ ans[2]).chr
    #i += 1
#end
