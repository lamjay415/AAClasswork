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

describe "#my_transpose" do
    let(:rows) { [[0,1,2],[3,4,5],[6,7,8]]}
    it "will convert between row orientated and column orientated representations" do
        expect(my_transpose(rows)).to eq(rows.transpose)
    end

    it "should be a 2d-array" do
        expect { my_transpose([0,1,2]) }.to raise_error("InvalidArray")
    end
end


describe "#stock_picker" do 
    let(:stocks) {[1,5,3,7,5,2,0]}
    it "should have an array with smaller stock price before the larger stock price." do 
        expect(stock_picker(stocks)).to eq([0,3])
    end
end

describe "#move" do
    let(:rod1) {[3,1]}
    let(:rod2) {[2,4,6]}
    let(:rod3) {[7]}
    it "index of second argument can't be smaller than the index of first element" do
        expect{ move(x,y)}.to raise_error("CantMove")
    end
end

describe "#won?" do
    #game = double('receiver')
    tower = Towers_of_Hanoi.new([3,1],[2,4,6],[7])
    it "should return false if one of the rods is not sorted or have less than 7 disks." do 
        expect(tower.won?).to eq(false) 
    end

    tower = Towers_of_Hanoi.new([],[],[7,6,5,4,3,2,1])
    it "should return true if one of the rods is sorted and have 7 disks" do
        expect(tower.won?).to eq(true) 
    end

end

# 1[3,1]
# 2[2,4,6]
# 3[7]

# [3]
# [2,4,6]
# [7,1]

# move(1,3)

# [1..7].reverse
# [7,6,5,4,3,2,1] 
# []
# []
