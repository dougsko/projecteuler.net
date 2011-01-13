require 'ffi_pe'

include PEMethods

describe "PEMethods" do
    before do
    end

    it "tests phi" do
        a = phi(9)
        a.should == 6
    end

    it "tests is_prime" do
        a = is_prime(9)
        b = is_prime(8)
        a.should == true and b.should == false
        puts "9 is prime and 8 is not."
    end

    it "tests gcd" do
        gcd(10,20).should == 10
        puts "gcd of 10 and 20 is 10."
    end            

    it "tests factorial" do
        facts = [1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800]
        1.upto(10) do |i|
            factorial(i).to_i.should == facts[i-1]
            puts "The factorial of #{i} is #{facts[i-1]}."
        end
    end

    it "tests count_digits" do
        a = ""
        1.upto 10 do |i|
            a << i.to_s
            n = a.to_i
            count_digits(n).should == n.to_s.length
            puts "#{n} is #{count_digits(n)} digits long."
        end
    end
end
