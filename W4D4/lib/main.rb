require "byebug"

def my_uniq(arr)
    arr.uniq
end


class Array
    def two_sum

        result = []

        self.each_with_index do |num,idx|
            (idx+1..self.length-1).each do |i|
                if self[idx] + self[i] == 0
                    result << [idx,i]
                end
            end
        end
        result
    end
end

def my_transpose(array)
    if !array.first.is_a?(Array)
        raise "InvalidArray"
    end
    array.transpose
end


def stock_picker(stocks)
    #loop twice
    #keep track of min max
    #update diff between min and max
    #return after the loop the biggest difference
    
    min = 0
    max = 0
    
    diff = 0
    stocks.each_with_index do |price, idx|
        (idx+1..stocks.length-1).each do |idx2|
           # debugger
            if (stocks[idx2] - stocks[idx] > diff) && (idx < idx2)
                diff = stocks[idx2] - stocks[idx]
                min = idx
                max = idx2
            end
        end
    end
    [min,max]
end


class Towers_of_Hanoi

    attr_reader :rod1, :rod2, :rod3

    def initialize(rod1, rod2, rod3)
        @rod1 = rod1
        @rod2 = rod2
        @rod3 = rod3
    end

    def start_game
        # arr = [1,2,3,4,5,6,7]
        # new_arr = [@rod1, @rod2, @rod3]

        
        # arr.shuffle.each do |ele|
        #     new_arr.sample.push(arr.pop)
        # end

        while !won?

            get_user_input
           
        end

    end

    def get_user_input
        
        puts "Please enter a disk number: " 
        disk_num = gets.chomp.to_i #1
        puts "Which rod do you want put onto? "
        rod_num = gets.chomp.to_i #2
        move(disk_num,rod_num)

    end

    #move(1,2)
    def move(disk_num,rod_num)
 
        if @old_rod.last < @rod2.last
            @rod2 << @old_rod.pop 
        else
            raise "InvalidMove"
        end

    end

    def won?
        arr = [1,2,3,4,5,6,7]
     if (@rod1.count == 7 || @rod2.count == 7 || @rod3.count == 7) && (@rod1.reverse == arr || @rod2.reverse == arr  || @rod3.reverse == arr)
        return true 
     end
     false
    end
    #randomize

end