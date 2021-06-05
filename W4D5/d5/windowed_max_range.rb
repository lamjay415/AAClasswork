def windowed_max_range(array,window_size)

    current_max_range = 0

    array.each_with_index do |num,idx|
        if idx + window_size < array.length + 1
            sub = array[idx...idx+window_size]
            if current_max_range < sub.max - sub.min 
                current_max_range = sub.max - sub.min
            end
        end
    end

    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class myQueue

    def initialize
        @store = []
    end

    def enqueue(ele)
        @store << ele
    end

    def dequeue
        @store.shift
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

end

class MyStack

    def initialize
        @store = []
    end

    def push(el)
        @store << el
    end

    def pop
        @store.pop
    end

    def peek
        @store.last
    end 

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end
end

class StackQueue


    def initialize
        @store = Stack.new
        @store2 = Stack.new
    end

    def enqueue(el)
        @store << el
    end

    def dequeue
        if !@store2.empty
            while !@store.empty?
                @store2 << store1.pop
            end
        end
        
    end

end
