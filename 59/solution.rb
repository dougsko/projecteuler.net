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


text_a = []

File.open('cipher1.txt', 'r') do |f|
    text_a << f.readlines
end

text_a = text_a.join(',').split(',')
text_a_small = text_a[0..299]

# lower case letters
# 61 - 7a hex
# 97 - 122 base10

# puts 65.to_s(16)
# puts [65.to_s(16)].pack("H*")

def check_word(array)
    test = ""
    winner = "con"
    array.each do |num|
       test += [num.to_s(16)].pack('H*')
    end
    return true if test == winner
    return false
end    

# To test:
# 103 111 100
# 100 103 111
#
def get_result(text)
    sum = 0
    #key = [103, 110, 121]
    key = [97, 110, 103]
    decrypted = []
    paragraph = []
    0.upto(text.size - 2) do |i|
        decrypted << (text[i].to_i ^ key[0])
        decrypted << (text[i+1].to_i ^ key[1])
        decrypted << (text[i+2].to_i ^ key[2])
        i += 3
    end
    decrypted.collect{|letter| paragraph << [letter.to_s(16)].pack("H*")}
    decrypted.collect{|letter| sum += letter}
    puts sum
    puts paragraph.join('')
end

#get_result(text_a)
#exit

freq = {}
word_s = ""
97.upto(122) do |a|
    97.upto(122) do |b|
        97.upto(122) do |c|
            0.upto(text_a.size - 2) do |i|
                x = text_a[i].to_i
                y = text_a[i+1].to_i
                z = text_a[i+2].to_i
                word = [a ^ x, b ^ y, c ^ z]
                if check_word(word)
                    #puts "#{a} #{b} #{c}"
                    if freq["#{a} #{b} #{c}"] == nil
                        freq["#{a} #{b} #{c}"] = 1
                    else
                        freq["#{a} #{b} #{c}"] += 1
                    end
                end
                i += 3
            end
        end
        puts freq.sort{|aa,bb| aa[1] <=> bb[1]}.last.inspect
    end
end

