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