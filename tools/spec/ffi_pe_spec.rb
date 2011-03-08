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
        a = is_prime(2)
        b = is_prime(8)
        c = is_prime(4)
        a.should == true and b.should == false and c.should == false
    end

    it "tests gcd" do
        gcd(10,20).should == 10
    end            

    it "tests factorial" do
        facts = [1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800]
        1.upto(10) do |i|
            factorial(i).to_i.should == facts[i-1]
        end
    end

    it "tests count_digits" do
        a = ""
        1.upto 10 do |i|
            a << i.to_s
            n = a.to_i
            count_digits(n).should == n.to_s.length
        end
    end

    it "tests is_bouncy" do
        is_bouncy("155349").should == true
        is_bouncy("12345").should == false
        is_bouncy("98764").should == false
    end

    it "tests next_prime" do
        next_prime("3").should == "5"
    end

    it "tests prob_prime" do
        prob_prime("100").should == false
        prob_prime("5").should == true
    end

end
