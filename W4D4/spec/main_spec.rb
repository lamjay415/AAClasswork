require "main"
require "rspec"

describe "#my_uniq" do
    it "returns the unique elements in order which they first appear" do 
        expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
    end
end