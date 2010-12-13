require 'pemethods'

describe "PEMethods" do
    before do
    end

    it "tests phi" do
        a = phi(9)
        a.should == 6
    end

    it "tests parallel_phi" do
        a = parallel_phi(9)
        a.should == 6
    end
end
