require 'pemethods'

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
    end

    it "tests gcd" do
        gcd(10,20).should == 10
    end            

    it "tests factorial" do
        factorial(5).should == "120"
    end

    it "tests count_digits" do
        count_digits(123).should == 3
    end
end
