require 'solution.rb'

describe "PE111" do
    before do
        @pe111 = Pe111.new
    end

    it "solves M(4,d)" do
        ans = [2, 3, 3, 3, 3, 3, 3, 3, 3]
        0.upto 9 do |i|
            @pe111.m(4,i).should == ans[i]
        end
    end

    it "solves N(4,d)" do
        ans = [13, 9, 1, 12, 2, 1, 1, 9, 1, 7]
        0.upto 9 do |i|
            @pe111.n(4,i).should == ans[i]
        end
    end

    it "solves S(4,d)" do
        ans = [67061, 22275, 2221, 46214, 8888, 5557, 6661, 57863, 8887, 48073]
        0.upto 9 do |i|
             @pe111.s(4,i).should == ans[i]
        end
    end

    it "solves the sum of S()" do
        sum = 0
        0.upto 9 do |i|
            sum += @pe111.s(4,i)
        end
        sum.should == 273700
    end
end

