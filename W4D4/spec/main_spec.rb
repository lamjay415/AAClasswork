require "main"
require "rspec"

describe "#my_uniq" do
    it "returns the unique elements in order which they first appear" do 
        expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
    end
end


describe "#two_sum" do
    it "returns 2D array where elements in the array sum up to 0" do
        expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
    end
end